import 'package:flutter/material.dart';
import 'theme.dart';
import 'pages/splash_page.dart';

void main() {
  runApp(UtsMobileApp());
}

class UtsMobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'uts_mobile',
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: SplashPage(),
    );
  }
}
