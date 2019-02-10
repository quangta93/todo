import 'package:flutter/material.dart';
import 'package:todo/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(title: 'Todo'),
    );
  }
}
