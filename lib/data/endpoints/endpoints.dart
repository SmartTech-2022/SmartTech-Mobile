import 'package:flutter/material.dart';

class EndPoints {
  static const String baseUrl = 'https://smarttech.ictyepprojects.com/api/';
  static const String login = '${baseUrl}login';
  static const String register = 'register';
  static const String elections = 'elections';
  static const String votes = 'votes';
  static const String contestants = 'contestants';

  void showMessage(String message, BuildContext context) {
    var snackbar = SnackBar(content: Text(message));

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
