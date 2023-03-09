import 'package:flutter/material.dart';

import '../app.dart';

void showSnackbar({
  required String message,
  required Color color,
}) =>
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color),
    );
