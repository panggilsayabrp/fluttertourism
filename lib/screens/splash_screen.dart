//import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dicoding_kemenparekraf/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(FontAwesomeIcons.mountain, color: Colors.white, size: 70,),
            Text(
              "Pariwisia",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
            /*TypewriterAnimatedTextKit(
              text: ['ddj'],
                textStyle: TextStyle(fontSize: 30.0,color: Colors.white,),
              speed: Duration(microseconds: 150),
            )*/
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds:4 ),(){
      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return WelcomeScreen();
      }));
    });
  }
}




