import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
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
        // isLightMode ? AppTheme.nearlyWhite : AppTheme.nearlyBlack,
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top,
                      left: 16,
                      right: 16),
                  child: Image.asset('assets/images/feedbackImage.png'),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 8),
                  child: const Text(
                    'Your FeedBack',
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
                    'Give your best time for this moment.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      // color: isLightMode ? Colors.black : Colors.white,
                    ),
                  ),
                ),
                _buildComposer(),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('send'),
                  ),
                ),
                //   child: Center(
                //     child: InkWell(
                //       onTap: () {
                //         FocusScope.of(context).requestFocus(FocusNode());
                //       },
                //       child: const Center(
                //         child: Padding(
                //           padding: EdgeInsets.all(4.0),
                //           child: (
                //             child: Text(
                //               'Send',
                //               style: TextStyle(
                //                 fontWeight: FontWeight.w500,
                //                 // color: isLightMode
                //                 //     ? Colors.white
                //                 //     : Colors.black,
                //               ),
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildComposer() {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 32, right: 32),
      child: ClipRRect(
        // borderRadius: BorderRadius.circular(25),
        child: Container(
          padding: const EdgeInsets.all(4.0),
          constraints: const BoxConstraints(minHeight: 80, maxHeight: 160),
          // color: AppTheme.white,
          child: SingleChildScrollView(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 0, bottom: 0),
            child: TextField(
              maxLines: null,
              onChanged: (String txt) {},
              style: const TextStyle(
                // fontFamily: AppTheme.fontName,
                fontSize: 16,
                // color: AppTheme.dark_grey,
              ),
              cursorColor: Colors.blue,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: 'Enter your feedback...'),
            ),
          ),
        ),
      ),
    );
  }
}
