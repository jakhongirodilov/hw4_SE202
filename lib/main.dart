// lib/main.dart
import 'package:flutter/material.dart';
import 'package:hw4/user_info_screen.dart'; // Replace with your actual project name
import 'package:hw4/sqlite_data_screen.dart'; // Replace with your actual project name

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HW4 App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/user_info',
      routes: {
        '/user_info': (context) => UserInfoScreen(),
        '/sqlite_data': (context) => SQLiteDataScreen(),
      },
    );
  }
}
