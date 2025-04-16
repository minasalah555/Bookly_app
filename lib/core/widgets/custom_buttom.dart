import 'package:bookly_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.fontColor,
    required this.backgroundColor,
    required this.borderRadius,
    required this.title,
    required this.fontSize,
    this.onPressed,
  });
  final double fontSize;
  final String title;
  final Color fontColor;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 54,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: borderRadius),
          ),
          child: Text(
            title,
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w900,
              color: fontColor,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
