import 'package:bfut/custom_drawer/home_drawer.dart';
import 'package:bfut/feedback_screen.dart';
import 'package:bfut/help_screen.dart';
import 'package:bfut/home_screen.dart';
import 'package:bfut/invite_friend_screen.dart';
import 'package:bfut/providers/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawerUserController extends ConsumerStatefulWidget {
  const DrawerUserController({
    super.key,
    this.drawerWidth = 250,
  });

  final double drawerWidth;

  @override
  ConsumerState<DrawerUserController> createState() =>
      _DrawerUserControllerState();
}

class _DrawerUserControllerState extends ConsumerState<DrawerUserController>
    with TickerProviderStateMixin {
  ScrollController? scrollController;
  AnimationController? iconAnimationController;
  AnimationController? animationController;
  final AnimatedIconData? animatedIconData = AnimatedIcons.arrow_menu;

  double scrolloffset = 0.0;
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    iconAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    iconAnimationController?.animateTo(1.0,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.fastOutSlowIn);
    scrollController =
        ScrollController(initialScrollOffset: widget.drawerWidth);
    scrollController!.addListener(() {
      if (scrollController!.offset <= 0) {
        if (scrolloffset != 1.0) {
          setState(() {
            scrolloffset = 1.0;
            try {
              // widget.drawerIsOpen!(true);
            } catch (_) {}
          });
        }
        iconAnimationController?.animateTo(0.0,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn);
      } else if (scrollController!.offset > 0 &&
          scrollController!.offset < widget.drawerWidth.floor()) {
        iconAnimationController?.animateTo(
            (scrollController!.offset * 100 / (widget.drawerWidth)) / 100,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn);
      } else {
        if (scrolloffset != 0.0) {
          setState(() {
            scrolloffset = 0.0;
            try {
              // widget.drawerIsOpen!(false);
            } catch (_) {}
          });
        }
        iconAnimationController?.animateTo(1.0,
            duration: const Duration(milliseconds: 1000),
            curve: Curves.fastOutSlowIn);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) => getInitState());
    drawerIndex = DrawerIndex.HOME;
    screenView = const MyHomePage();
    super.initState();
  }

  Future<bool> getInitState() async {
    scrollController?.jumpTo(
      widget.drawerWidth,
    );
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final brightness = ref.watch(brightnessProvider);
    final isLightMode = brightness == Brightness.light;
    final backgroundColor = Theme.of(context).colorScheme.surface;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width + widget.drawerWidth,
          //we use with as screen width and add drawerWidth (from navigation_home_screen)
          child: Row(
            children: <Widget>[
              SizedBox(
                width: widget.drawerWidth,
                //we divided first drawer Width with HomeDrawer and second full-screen Width with all home screen, we called screen View
                height: MediaQuery.of(context).size.height,
                child: AnimatedBuilder(
                  animation: iconAnimationController!,
                  builder: (BuildContext context, Widget? child) {
                    return Transform(
                      //transform we use for the stable drawer  we, not need to move with scroll view
                      transform: Matrix4.translationValues(
                          scrollController!.offset, 0.0, 0.0),
                      child: HomeDrawer(
                        screenIndex: drawerIndex ?? DrawerIndex.HOME,
                        iconAnimationController: iconAnimationController,
                        callBackIndex: (DrawerIndex indexType) {
                          onDrawerClick();
                          try {
                            // widget.onDrawerCall!(indexType);
                            changeIndex(indexType);
                          } catch (e) {
                            print(e);
                          }
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                //full-screen Width with widget.screenView
                child: Container(
                  decoration: const BoxDecoration(
                    // color: AppTheme.white,
                    boxShadow: <BoxShadow>[
                      BoxShadow(
                          // color: AppTheme.grey.withOpacity(0.6),
                          blurRadius: 24),
                    ],
                  ),
                  child: Stack(
                    children: <Widget>[
                      //this IgnorePointer we use as touch(user Interface) widget.screen View, for example scrolloffset == 1 means drawer is close we just allow touching all widget.screen View
                      IgnorePointer(
                        ignoring: scrolloffset == 1,
                        child: screenView,
                      ),
                      //alternative touch(user Interface) for widget.screen, for example, drawer is close we need to tap on a few home screen area and close the drawer
                      if (scrolloffset == 1.0)
                        InkWell(
                          onTap: () {
                            onDrawerClick();
                          },
                        ),
                      _buildDrawerIcon(isLightMode: isLightMode)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onDrawerClick() {
    //if scrollcontroller.offset != 0.0 then we set to closed the drawer(with animation to offset zero position) if is not 1 then open the drawer
    if (scrollController!.offset != 0.0) {
      scrollController?.animateTo(
        0.0,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    } else {
      scrollController?.animateTo(
        widget.drawerWidth,
        duration: const Duration(milliseconds: 400),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  Widget _buildDrawerIcon({bool isLightMode = true}) {
    // this just menu and arrow icon animation
    return Padding(
      padding:
          EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8, left: 8),
      child: SizedBox(
        width: AppBar().preferredSize.height - 8,
        height: AppBar().preferredSize.height - 8,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(AppBar().preferredSize.height),
            child: Center(
              // if you use your own menu view UI you add form initialization
              child: AnimatedIcon(
                  // color: isLightMode ? AppTheme.dark_grey : AppTheme.white,
                  icon: animatedIconData ?? AnimatedIcons.arrow_menu,
                  progress: iconAnimationController!),
            ),
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
              onDrawerClick();
            },
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      switch (drawerIndex) {
        case DrawerIndex.HOME:
          setState(() {
            screenView = const MyHomePage();
          });
          break;
        case DrawerIndex.Help:
          setState(() {
            screenView = const HelpScreen();
          });
          break;
        case DrawerIndex.FeedBack:
          setState(() {
            screenView = const FeedbackScreen();
          });
          break;
        case DrawerIndex.Invite:
          setState(() {
            screenView = const InviteFriend();
          });
          break;
        default:
          break;
      }
    }
  }
}
