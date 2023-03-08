import 'package:flutter/material.dart';

void showSnackbar(
  BuildContext context, {
  required String message,
  required Color color,
}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
