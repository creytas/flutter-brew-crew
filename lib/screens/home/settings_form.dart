import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:brew_app/shared/constants.dart';

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
  String _currentSugar = "";
  int _currentStrength = 0;

  @override
  Widget build(BuildContext context) {
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
            decoration: textInputDecoration.copyWith(hintText: 'Name'),
            onChanged: (value) {
              setState(() => _currentName = value);
              if (kDebugMode) {
                print(value);
              }
            },
            validator: (value) => value!.isEmpty ? 'Enter your name' : null,
          ),
          const SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
              onPressed: () {
                if (kDebugMode) {
                  print(
                      "name: $_currentName, sugars: $_currentSugar and strength: $_currentStrength");
                }
              },
              child: const Text("Update"))
        ],
      ),
    );
  }
}
