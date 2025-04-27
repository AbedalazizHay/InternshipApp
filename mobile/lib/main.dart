import 'package:flutter/material.dart';
import 'package:xpertbot/pages/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  SplashPage(), // Set SplashPage as the home screen
    );
  }
}
