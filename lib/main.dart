import 'package:brew_app/screens/wrapper.dart';
import 'package:brew_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(StreamProvider<User?>.value(
    initialData: null,
    value: AuthService().user,
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    ),
  ));
}
