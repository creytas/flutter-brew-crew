import 'package:brew_app/models/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // User? _firebaseUser(User user) {
  //   if (kDebugMode) {
  //     print("_firebaseUser is $user");
  //   }
  //   return user;
  // }

  Stream<User?> get user => _auth.authStateChanges();

  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      if (kDebugMode) {
        print("the user sent is $user");
        //print(_firebaseUser(user!));
      }
      return user;
      //return _firebaseUser(user!);
    } catch (error) {
      if (kDebugMode) {
        print("error occured $error");
      }
      return null;
    }
  }

  Future signOut() async {
    try {
      if (kDebugMode) {
        print("user logged out successfully");
      }
      return await _auth.signOut();
    } catch (error) {
      if (kDebugMode) {
        print("error occured $error");
      }
    }
  }
}
