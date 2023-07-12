import 'package:flutter/material.dart';

final textInputDecoration = InputDecoration(
  fillColor: Colors.grey.shade200,
  filled: true,
  enabledBorder: const OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.brown.shade400, width: 2.0),
  ),
);
