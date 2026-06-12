import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;
  final Color backgroundColor, foregroundColor;
  final BorderRadiusGeometry borderRadius;
  const CustomButton({
    super.key,
    required this.child,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        onPressed: () {},
        child: child,
      ),
    );
  }
}
