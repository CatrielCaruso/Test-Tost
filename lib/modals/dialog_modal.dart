import 'package:flutter/material.dart';

import 'package:test_tots/theme/custom_style_theme.dart';

class DialogModal {
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

  static void customShowDialog({
    required BuildContext context,
    required String text,
    required VoidCallback accept,
  }) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(
              text,
              style: const TextStyle(
                  fontFamily: CustomStylesTheme.fontFamilyDMsans,
                  fontSize: 16,
                  fontWeight: CustomStylesTheme.fontWeightMedium,
                  color: CustomStylesTheme.blackColor),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancel',
                  style: TextStyle(
                      fontFamily: CustomStylesTheme.fontFamilyDMsans,
                      fontSize: 13,
                      fontWeight: CustomStylesTheme.fontWeightMedium,
                      color: CustomStylesTheme.blackColor),
                ),
              ),
              TextButton(
                  onPressed: accept,
                  child: const Text(
                    'Ok',
                    style: TextStyle(
                        fontFamily: CustomStylesTheme.fontFamilyDMsans,
                        fontSize: 13,
                        fontWeight: CustomStylesTheme.fontWeightMedium,
                        color: CustomStylesTheme.blackColor),
                  )),
            ],
          );
        });
  }
}
