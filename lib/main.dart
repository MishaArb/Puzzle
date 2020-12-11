import 'package:flutter/material.dart';
import 'package:puzzle_game/boards/start_page.dart';
import 'package:puzzle_game/boards/board3x3.dart';
import 'package:puzzle_game/boards/board5x5.dart';
import 'package:puzzle_game/boards/board6x6.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Puzzle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StartPage(),
    );
  }
}
