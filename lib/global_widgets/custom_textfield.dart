import 'package:flutter/material.dart';

import '../core/theme/values/colors.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    Key? key,
    this.labelText,
    this.textEditingController,
    this.keyboardType,
    this.maxLines = 1,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.obscureText = false,
    this.enabled,
    this.onChanged,
    this.blurRadius,
    this.elevation,
    this.hintText,
  }) : super(key: key);

  final String? labelText;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final int? maxLines;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool? enabled;
  final void Function(String)? onChanged;
  final double? blurRadius;
  final double? elevation;
  final String? hintText;

  final InputBorder bordersStyle = const OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(color: black),
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: elevation ?? 5,
      child: TextFormField(
        enabled: enabled,
        controller: textEditingController,
        keyboardType: keyboardType,
        maxLines: maxLines,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: const Color.fromARGB(255, 248, 245, 245),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 30.0, horizontal: 25.0),
          filled: true,
          labelText: labelText,
          labelStyle: const TextStyle(
            color: black2,
            fontSize: 20,
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          border: bordersStyle,
          enabledBorder: bordersStyle,
          focusedBorder: bordersStyle,
          disabledBorder: bordersStyle,
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        validator: validator,
        onChanged: onChanged,
      ),
    );
  }
}
