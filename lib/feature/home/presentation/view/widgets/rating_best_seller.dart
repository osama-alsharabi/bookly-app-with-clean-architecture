import 'package:bookly_app_with_clean_architure/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class RatingBestSeller extends StatelessWidget {
  const RatingBestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Color(0xffFFDD4F)),
        const SizedBox(width: 6.3),
        Text(
          "4.0",
          style: AppStyle.textStyle16Medium.copyWith(color: Colors.white),
        ),
        const SizedBox(width: 5),
        const Text("(255)", style: AppStyle.textStyle14Regular),
      ],
    );
  }
}
