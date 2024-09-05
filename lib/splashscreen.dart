import 'dart:async';

import 'package:flutter/material.dart';
import 'package:validationpage/GlobalComponents/GlobalAppImage.dart';
import 'package:validationpage/formscreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) => Formscreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          GlobalAppImage.SplashImage,
          height: 300,
          width: 300,
        ),
      ),
    );
  }
}
