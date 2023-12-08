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

class CustomButtomOpcion extends StatelessWidget {
  final Color color;
  final String text;
  final Widget image;
  const CustomButtomOpcion({
    super.key,
    required this.color,
    required this.text,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 17),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 12,
            ),
            image,
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontFamily: CustomStylesTheme.fontFamilyDMsans,
                  color: CustomStylesTheme.whiteColor,
                  fontSize: 16,
                  fontWeight: CustomStylesTheme.fontWeightSmall),
            ),
          ],
        ));
  }
}
