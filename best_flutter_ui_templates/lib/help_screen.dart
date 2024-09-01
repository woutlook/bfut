import 'package:flutter/material.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({super.key});

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var brightness = MediaQuery.of(context).platformBrightness;
    // bool isLightMode = brightness == Brightness.light;
    return SafeArea(
      top: false,
      child: Scaffold(
        // backgroundColor:
        //     isLightMode ? AppTheme.nearlyWhite : AppTheme.nearlyBlack,
        body: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top, left: 16, right: 16),
              child: Image.asset('assets/images/helpImage.png'),
            ),
            Container(
              padding: const EdgeInsets.only(top: 8),
              child: const Text(
                'How can we help you?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  // color: isLightMode ? Colors.black : Colors.white,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 16),
              child: const Text(
                'It looks like you are experiencing problems\nwith our sign up process. We are here to\nhelp so please get in touch with us',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  // color: isLightMode ? Colors.black : Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'Chat with Us',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline
                            // color:
                            //     isLightMode ? Colors.white : Colors.black,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
