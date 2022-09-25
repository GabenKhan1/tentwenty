import 'package:flutter/material.dart';
import 'package:flutter_tentwenty_app/core/theme/values/colors.dart';

class CustomElevatedButtonWidget extends StatelessWidget {
  const CustomElevatedButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.borderRadius,
    this.verticalPadding,
    this.horizontalPadding,
    this.fontSize,
    this.icon,
  }) : super(key: key);

  final String text;
  final void Function()? onPressed;
  final Color? color;
  final double? borderRadius;
  final double? verticalPadding;
  final double? horizontalPadding;
  final double? fontSize;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color ?? primary),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 0,
          vertical: verticalPadding ?? 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: TextStyle(
                fontFamily: "Poppins",
                color: white,
                fontSize: fontSize ?? 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
