// lib/sqlite_data_screen.dart
import 'package:flutter/material.dart';
import 'package:hw4/database_helper.dart'; // Replace with your actual project name

class SQLiteDataScreen extends StatefulWidget {
  @override
  _SQLiteDataScreenState createState() => _SQLiteDataScreenState();
}

class _SQLiteDataScreenState extends State<SQLiteDataScreen> {
  List<Map<String, dynamic>> users = [];

  void loadUsersFromDatabase() async {
    List<Map<String, dynamic>> dbUsers = await DatabaseHelper.instance.getUsers();
    setState(() {
      users = dbUsers;
    });
  }

  @override
  void initState() {
    super.initState();
    loadUsersFromDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Data Screen'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(users[index]['name'] ?? ''),
            subtitle: Text(users[index]['email'] ?? ''),
          );
        },
      ),
    );
  }
}
