import 'package:chamting_app/main.dart';
import 'package:flutter/material.dart';

void showSnackbar({
  required String message,
  required Color color,
}) =>
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color,
      ),
    );
