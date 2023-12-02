
import 'package:flutter/material.dart';

import 'package:test_tots/theme/custom_style_theme.dart';

class CustomButtomWidget extends StatelessWidget {
  final String title;
  const CustomButtomWidget({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
      decoration: const BoxDecoration(
        color: CustomStylesTheme.textDarkColor,
        borderRadius: BorderRadius.all(
          Radius.circular(34),
        ),
        boxShadow: [
          BoxShadow(
            color: CustomStylesTheme.shadowColor,
            offset: Offset(
              0.0,
              4.0,
            ),
            blurRadius: 15.0,
          ), //BoxShadow
          //BoxShadow
        ],
      ),
      child: Text(
        title,
        style: const TextStyle(
            fontFamily: CustomStylesTheme.fontFamilyDMsans,
            color: CustomStylesTheme.whiteColor,
            fontSize: 14,
            fontWeight: CustomStylesTheme.fontWeightMedium),
      ),
    );
  }
}