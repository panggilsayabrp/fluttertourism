import 'package:dicoding_kemenparekraf/screens/home_screen.dart';
import 'package:dicoding_kemenparekraf/widgets/gradient_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageWelcome(),
            TextWelcome(),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: GradientButton(
                text: "Mulai sekarang!",
                onPress: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ), (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TextWelcome extends StatelessWidget {
  const TextWelcome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Tips",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: size.width * 0.07,
              ),
            ),
          ),
          SizedBox(height: 15.0),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Berwisata Disaat Pandemi",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.07,
              ),
            ),
          ),
          SizedBox(height: 10.0,),
          Text(
            "Tetap patuhi protokol kesehatan Covid 19 saat anda berwisata.\nDengan menjaga jarak, memakai masker dengan benar, hindari memegang area muka, selalu cuci tangan dengan air yang mengalir dan sabun.",
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: size.width * 0.04,
            ),
          ),
          SizedBox(height: 10.0,),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Stay Safe, Stay Healthy",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: size.width * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageWelcome extends StatelessWidget {
  const ImageWelcome({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height / 2,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )
      ),
      child: Image.asset(
        "assets/images/mountain.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}