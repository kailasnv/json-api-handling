import 'package:flutter/material.dart';

class PopUps {
  void showErrorMessage(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message, style: const TextStyle(color: Colors.black)),
      backgroundColor: Colors.white,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
