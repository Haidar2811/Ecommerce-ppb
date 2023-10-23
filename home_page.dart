import 'package:flutter/material.dart';
import 'login_page.dart';
import 'user.dart';

class HomePage extends StatelessWidget {
  final User user;

  HomePage({required this.user});

  void handleLogout(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () => handleLogout(context),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome, ${user.firstName} ${user.lastName}!'),
            SizedBox(height: 16.0),
            CircleAvatar(
              radius: 80.0,
              backgroundImage: NetworkImage(user.image),
            ),
            SizedBox(height: 16.0),
            Text('Email: ${user.email}'),
            Text('Phone: ${user.phone}'),
            Text('Username: ${user.username}'),
          ],
        ),
      ),
    );
  }
}
