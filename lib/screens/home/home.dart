import 'package:brew_app/screens/home/brew_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:brew_app/services/auth.dart';
import 'package:brew_app/services/database.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService().brews,
      initialData: null,
      child: Scaffold(
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
                  "",
                  style: TextStyle(color: Colors.grey.shade100),
                ))
          ],
        ),
        body: BrewList(),
      ),
    );
  }
}
