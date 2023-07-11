import 'package:brew_app/services/auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  const SignIn({super.key, required this.toggleView});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String? error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown.shade100,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade400,
        elevation: 0.0,
        actions: [
          TextButton.icon(
            onPressed: () {
              widget.toggleView();
              if (kDebugMode) {
                print("register clicked");
              }
            },
            icon: Icon(
              Icons.person_add_alt_1,
              color: Colors.grey.shade100,
            ),
            label: Text(
              "",
              style: TextStyle(
                color: Colors.grey.shade100,
              ),
            ),
          )
        ],
        title: const Text("Sign in to Brew Crew"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
        child: Form(
          key: _formKey,
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
                validator: (value) =>
                    value!.isEmpty ? 'Enter your email' : null,
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
                validator: (value) =>
                    value!.length < 6 ? 'Enter a +6 chars password' : null,
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    if (kDebugMode) {
                      print("email: $email & password: $password");
                    }
                    dynamic result = await _auth.signInWithMailAndPassword(
                        email: email, password: password);
                    if (result == null) {
                      setState(() =>
                          error = 'could not sign in with those credentials');
                    }
                  }
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.brown.shade400)),
                child: Text(
                  "Sign in",
                  style: TextStyle(color: Colors.grey.shade100),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(
                error!,
                style: const TextStyle(color: Colors.red, fontSize: 14.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
