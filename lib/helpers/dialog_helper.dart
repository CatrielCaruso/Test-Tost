import 'package:flutter/material.dart';

import 'package:test_tots/theme/custom_style_theme.dart';

class DialogHelper {
  static void customShowDialog(
      {required BuildContext context, required String text}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: CustomStylesTheme.whiteColor,
            content: Text(text,
                style: const TextStyle(
                  fontSize: 16,
                  fontFamily: CustomStylesTheme.fontFamilyDMsans,
                  fontWeight: CustomStylesTheme.fontWeightMedium,
                  color: CustomStylesTheme.textDarkColor,
                )),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'OK',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: CustomStylesTheme.fontFamilyDMsans,
                    fontWeight: CustomStylesTheme.fontWeightMedium,
                    color: CustomStylesTheme.textDarkColor,
                  ),
                ),
              )
            ],
          );
        });
  }
}
