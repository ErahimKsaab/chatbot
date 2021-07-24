import 'package:chattpot/NAV1.dart';
import 'package:chattpot/chatpot.dart';
import 'package:chattpot/splashscreen.dart';
import 'package:chattpot/webciew.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Chat Bot',
      home: SplashScrean(),
    );
  }
}
