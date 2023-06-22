import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
// ignore: unused_import
import '../pages//welcome.dart';

class SplashScreen extends StatefulWidget {
  final int duration;
  final Widget navigateAfterSeconds;
  final String imagePath;
  final Color backgroundColor;
  final TextStyle styleTextUnderTheLoader;
  final double photoSize;
  final Color loaderColor;

  // ignore: use_key_in_widget_constructors
  const SplashScreen({
    required this.duration,
    required this.navigateAfterSeconds,
    required this.imagePath,
    this.backgroundColor = Colors.white,
    this.styleTextUnderTheLoader = const TextStyle(),
    this.photoSize = 100.0,
    this.loaderColor = Colors.blue,
  });

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: widget.duration),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => widget.navigateAfterSeconds),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              widget.imagePath,
              width: widget.photoSize,
              height: widget.photoSize,
            ),
            const SizedBox(height: 20.0),
            SpinKitFadingCube(
              color: widget.loaderColor,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
