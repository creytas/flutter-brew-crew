import 'package:brew_app/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        elevation: 0.0,
        title: const Text("Sign in to Brew Crew"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Form(
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() => email = value);
                  if (kDebugMode) {
                    print(value);
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: true,
                onChanged: (value) {
                  setState(() => password = value);
                  if (kDebugMode) {
                    print(value);
                  }
                },
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (kDebugMode) {
                    print("email: $email & password: $password");
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.brown.shade400)),
                child: Text(
                  "Sign in",
                  style: TextStyle(color: Colors.grey.shade100),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
