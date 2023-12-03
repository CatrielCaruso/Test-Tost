import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget(
      {Key? key,
      this.label,
      this.hint,
      this.errorMessage,
      this.onChanged,
      this.validator,
      this.obscureText = false,
      this.suffixIcon,
      this.controller,
      this.keyboardType,
      this.fillColor = Colors.transparent,
      this.inputFormatters,
      this.focusNode,
      this.autovalidateMode, this.onTapOutside})
      : super(key: key);
  final String? label;
  final String? hint;
  final String? errorMessage;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final AutovalidateMode? autovalidateMode;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final void Function(PointerDownEvent)? onTapOutside;
  final Color? fillColor;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    // );

    return TextFormField(
      onTapOutside:onTapOutside ,
      autovalidateMode: autovalidateMode,
      focusNode: focusNode,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      obscureText: obscureText,
      inputFormatters: inputFormatters ?? [],
      decoration: InputDecoration(
        suffixIcon: (suffixIcon != null) ? suffixIcon : null,
        contentPadding: const EdgeInsets.only(left: 0),
        floatingLabelStyle: const TextStyle(
          color: Colors.black,
        ),
        hintText: hint,
        isDense: true,
        label: (label != null)
            ? Text(
                label!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            : null,
        fillColor: fillColor,
        filled: true,
        errorText: errorMessage,
      ),
    );
  }
}
