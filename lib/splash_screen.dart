import 'dart:async';
import 'package:flutter/material.dart';
import 'package:codesangam/login.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:codesangam/dashboard.dart';
import 'package:codesangam/main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var email = await prefs.getString('email');
  // runApp(MaterialApp(
  //   home: email == null ? LoginPage() : MyHomePage(),
  // ));
  runApp(MaterialApp(
    home: email == null ? LoginPage() : Dashboard(),
  ));
  // runApp(MyApp());
  // runApp(LoginApp());
}

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 3500), () async {
      // Timer(Duration(milliseconds: 4500), () {
      // Timer(Duration(milliseconds: 45), () {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var email = prefs.getString('email');
      if (email != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ),
        );
      }
    });
  }

// class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          // child: Text('CodeSangam',
          //     style: TextStyle(
          //         color: Colors.white,
          //         fontWeight: FontWeight.w700,
          //         fontSize: 34)),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText('CodeCollab',
                  speed: const Duration(milliseconds: 200),
                  textStyle: TextStyle(
                      fontFamily: 'appti',
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: 34)),
              // ColorizeAnimatedText(
              //   'CodeSangam',
              //   speed: const Duration(milliseconds: 1200),
              //   textStyle: TextStyle(
              //     fontWeight: FontWeight.w700,
              //     fontSize: 34,
              //     // color: Colors.white,
              //     // fontFamily: 'Bobbers',
              //   ),
              //   colors: [
              //     Colors.white,
              //     Colors.white,
              //     Colors.purple,
              //     // Colors.purple,
              //     // Colors.blue,
              //     // Colors.blue,
              //     Colors.yellow,
              //     Colors.yellow,
              //     Colors.red,
              //     Colors.red,
              //   ],
              // ),
            ],
          ),
        ),
        width: double.infinity,
        height: 900,
        color: Colors.blue,
      ),
    );
    // throw UnimplementedError();
  }
}
