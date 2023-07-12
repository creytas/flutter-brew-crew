import 'package:brew_app/screens/auth/auth.dart';
import 'package:brew_app/screens/home/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);
    if (kDebugMode) {
      print(user);
    }
    if (user == null) {
      return const Authenticate();
    } else {
      return Home();
    }
  }
}
