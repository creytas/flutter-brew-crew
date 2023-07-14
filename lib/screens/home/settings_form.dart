import 'package:brew_app/models/user.dart';
import 'package:brew_app/services/database.dart';
import 'package:brew_app/shared/loading.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:brew_app/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({super.key});

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ["0", "1", "2", "3", "4"];

  //current values
  String _currentName = "";
  String _currentSugar = "0";
  int _currentStrength = 100;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user!.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData? userData = snapshot.data;

            return Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                    "Update your brew settings",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    initialValue: userData!.name,
                    decoration: textInputDecoration.copyWith(hintText: 'Name'),
                    onChanged: (value) {
                      setState(() => _currentName = value);
                      if (kDebugMode) {
                        print("current name value is : $value");
                      }
                    },
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your name' : null,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  DropdownButtonFormField(
                    value: userData.sugars ?? _currentSugar,
                    decoration: textInputDecoration,
                    dropdownColor: Colors.brown.shade100,
                    items: sugars.map((sugar) {
                      return DropdownMenuItem(
                        value: sugar,
                        child: Text("$sugar sugar(s)"),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() => _currentSugar = value!);
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Slider(
                    activeColor: Colors.brown[_currentStrength],
                    inactiveColor: Colors.grey.shade200,
                    min: 100,
                    max: 900,
                    divisions: 8,
                    value: _currentStrength.toDouble(),
                    onChanged: (value) {
                      setState(() => _currentStrength = value.round());
                    },
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (kDebugMode) {
                            print(
                                "name: $_currentName, sugars: $_currentSugar and strength: $_currentStrength");
                          }
                          await DatabaseService(uid: user.uid).updateUserData(
                              sugars: _currentSugar,
                              name: _currentName,
                              strength: _currentStrength);
                          Navigator.pop(context);
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.brown.shade400)),
                      child: const Text("Update"))
                ],
              ),
            );
          } else {
            return const Loading();
          }
        });
  }
}
