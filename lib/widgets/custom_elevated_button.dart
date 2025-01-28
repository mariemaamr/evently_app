import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? icon;
  final String? text;
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double elevation;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    this.icon,
    this.text,
    this.backgroundColor = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.elevation = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          if (icon != null && text != null) const SizedBox(width: 8),
          if (text != null)
            Text(
              text!,
              style: TextStyle(color: textColor, fontSize: 16),
            ),
        ],
      ),
    );
  }
}
