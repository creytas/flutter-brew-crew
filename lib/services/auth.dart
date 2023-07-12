import 'package:brew_app/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get user => _auth.authStateChanges();

  ///an anonyme sign in function
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      if (kDebugMode) {
        print("the user sent is $user");
      }
      return user;
    } catch (error) {
      if (kDebugMode) {
        print("error occured $error");
      }
      return null;
    }
  }

  /// a sign in function with login and password
  Future signInWithMailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      if (kDebugMode) {
        print("the user $user signed in successfully");
      }
      return user;
    } catch (error) {
      if (kDebugMode) {
        print('error occured: $error');
      }
      return null;
    }
  }

  /// a register fuction with login and password
  Future registerWithMailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      await DatabaseService(uid: user!.uid)
          .updateUserData(sugars: '0', name: 'new crew member', strength: 100);
      if (kDebugMode) {
        print("the created user is $user");
      }
      return user;
    } catch (error) {
      if (kDebugMode) {
        print("error has occured: $error");
      }
      return null;
    }
  }

  /// a sign out function
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
