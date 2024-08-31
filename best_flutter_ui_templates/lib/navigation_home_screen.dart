import 'package:bfut/app_theme.dart';
import 'package:bfut/custom_drawer/drawer_user_controller.dart';
import 'package:bfut/custom_drawer/home_drawer.dart';
import 'package:flutter/material.dart';

class NavigationHomeScreen extends StatefulWidget {
  const NavigationHomeScreen({super.key});

  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget? screenView;
  DrawerIndex? drawerIndex;

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    // screenView = const MyHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.white,
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            // screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            // onDrawerCall: (DrawerIndex drawerIndexdata) {
            // changeIndex(drawerIndexdata);
            //callback from drawer for replace screen as user need with passing DrawerIndex(Enum index)
            // },
            // screenView: screenView,
            //we replace screen view as we need on navigate starting screens like MyHomePage, HelpScreen, FeedbackScreen, etc...
          ),
        ),
      ),
    );
  }
}
