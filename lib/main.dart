import 'package:alnawawiforty/screens/AudioAhadith.dart';
import 'package:alnawawiforty/screens/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hadith",
      debugShowCheckedModeBanner: false,
      home:  SplashScreen()
    );
  }
}