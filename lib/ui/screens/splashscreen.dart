import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:crypto_app/ui/screens/landscreen.dart';
import 'package:crypto_app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  static const colorizeColors = [
    constants.purcolor,
    Colors.blue,
    Colors.yellow,
    Colors.red,
  ];

  static final TextStyle colorizeTextStyle = GoogleFonts.quicksand(
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );

  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration(milliseconds: 2000),
      () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LandScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            child: AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText('CRYPBIT',
                    textStyle: colorizeTextStyle, colors: colorizeColors),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
