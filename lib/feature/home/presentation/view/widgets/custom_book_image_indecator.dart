import 'package:flutter/material.dart';

class CustomBookImageIndecator extends StatelessWidget {
  const CustomBookImageIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.7 / 4,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(12),
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
