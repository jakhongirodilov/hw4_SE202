// lib/user_info_screen.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hw4/database_helper.dart'; // Replace with your actual project name

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  List<Map<String, dynamic>> users = [];

  Future<void> fetchUser() async {
    final response = await http.get(Uri.parse('https://randomuser.me/api/'));
    if (response.statusCode == 200) {
      Map<String, dynamic> userData = json.decode(response.body);
      setState(() {
        users.add({
          'name': userData['results'][0]['name']['first'],
          'email': userData['results'][0]['email'],
        });
      });
    } else {
      throw Exception('Failed to load user');
    }
  }

  void storeUserDataInDatabase() async {
    int userId = await DatabaseHelper.instance.insertUser(users.last);
    print('User stored with ID: $userId');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              fetchUser();
            },
            child: Text('Get More User from API'),
          ),
          ElevatedButton(
            onPressed: () {
              storeUserDataInDatabase();
              Navigator.pushNamed(context, '/sqlite_data');
            },
            child: Text('Store Data in SQLite and Open Third Screen'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(users[index]['name']),
                  subtitle: Text(users[index]['email']),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
