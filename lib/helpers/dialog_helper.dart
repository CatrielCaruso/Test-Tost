import 'package:flutter/material.dart';

class DialogHelper {
  static void customSnackBar(
      {required BuildContext context,
      required String text,
      required Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: color,
        duration: const Duration(seconds: 1),
        content: SizedBox(
          width: double.infinity,
          child: Text(text),
        ),
      ),
    );
  }
}
