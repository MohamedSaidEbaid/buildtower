import 'package:build_tower/screens/home_page.dart';
import 'package:build_tower/screens/level10.dart';
import 'package:build_tower/screens/level11.dart';
import 'package:build_tower/screens/level4.dart';
import 'package:build_tower/screens/level5.dart';
import 'package:build_tower/screens/level6.dart';
import 'package:build_tower/screens/level7.dart';
import 'package:build_tower/screens/level8.dart';
import 'package:build_tower/screens/level9.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Build tower',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Level11(),
    );
  }
}
