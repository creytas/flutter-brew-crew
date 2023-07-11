import 'package:flutter/foundation.dart';
import 'package:brew_app/services/auth.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade50,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        elevation: 0.0,
        title: const Text("Brew Crew"),
        actions: [
          TextButton.icon(
              onPressed: () async {
                await _auth.signOut();
                if (kDebugMode) {
                  print("the user logged out successfully");
                }
              },
              icon: Icon(
                Icons.logout,
                color: Colors.grey.shade100,
              ),
              label: Text(
                "Logout",
                style: TextStyle(color: Colors.grey.shade100),
              ))
        ],
      ),
    );
  }
}
