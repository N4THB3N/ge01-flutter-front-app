import 'package:flutter/material.dart';

class InputDecorations {
  static InputDecoration authInputDecoration({
    required String hintText,
    required String labelText,
    required IconData prefixIcon,
  }) {
    return InputDecoration(
      hintText: hintText,
      labelText: labelText,
      prefixIcon: Icon(prefixIcon),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple)
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.deepPurple, width: 2)
      )
    );
  }
}