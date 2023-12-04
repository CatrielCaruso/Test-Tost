import 'package:flutter/material.dart';
import 'package:test_tots/theme/custom_style_theme.dart';

/// La función [onSearch] tiene que poder recibir un string en su argumento.
class InputSearchWidget extends StatefulWidget {
  const InputSearchWidget({
    Key? key,
    this.label,
    this.hint,
    this.errorMessage,
    this.onChanged,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType,
    this.title,
    this.searchIcon = false,
    this.widthText = 100,
    this.onSearch,
    this.onTapOutside,
    this.focusNode,
  }) : super(key: key);
  final String? label;
  final String? hint;
  final FocusNode? focusNode;
  final String? errorMessage;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;
  final void Function(PointerDownEvent)? onTapOutside;
  final TextInputType? keyboardType;
  final String? title;
  final bool searchIcon;
  final double? widthText;
  final Function? onSearch;

  @override
  State<InputSearchWidget> createState() => _InputSearchWidgetState();
}

class _InputSearchWidgetState extends State<InputSearchWidget> {
  late TextEditingController editingController;

  @override
  void initState() {
    super.initState();
    editingController = TextEditingController();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    editingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50),
      borderSide: const BorderSide(color: Colors.grey),
    );

    return TextFormField(
      focusNode: widget.focusNode,
      onTapOutside: widget.onTapOutside,
      keyboardType: widget.keyboardType,
      controller: editingController,
      onChanged: (_) {
        if (widget.onSearch == null) return;
        widget.onSearch!(editingController.text);
      },
      validator: widget.validator,
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        suffixIcon: (editingController.text != '')
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  /* Clear the search field */
                  editingController.clear();
                  widget.onSearch!(editingController.text);
                },
              )
            : null,
        prefixIcon: Image.asset(
          'assets/img/ic_search.png',
        ),
        contentPadding: const EdgeInsets.only(left: 0),
        floatingLabelStyle: const TextStyle(color: Colors.black),
        hintText: widget.hint,
        hintStyle: const TextStyle(
            fontSize: 13,
            fontFamily: CustomStylesTheme.fontFamilyDMsans,
            fontWeight: CustomStylesTheme.fontWeightMedium,
            color: CustomStylesTheme.hintColor),
        isDense: true,
        label: (widget.label != null) ? Text(widget.label!) : null,
        fillColor: Colors.white,
        filled: true,
        errorText: widget.errorMessage,
        enabledBorder: border,
        focusedBorder: border,
        errorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
        focusedErrorBorder:
            border.copyWith(borderSide: BorderSide(color: Colors.red.shade800)),
      ),
    );
  }
}
