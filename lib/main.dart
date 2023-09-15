import 'package:flutter/material.dart';
import 'package:project2/about_me.dart';
import 'package:project2/login_screen.dart';
import 'package:project2/navbar.dart';
import 'package:project2/stopwatch.dart';
import 'package:project2/timer.dart';

void main() => runApp(StopwatchApp());

class StopwatchApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}