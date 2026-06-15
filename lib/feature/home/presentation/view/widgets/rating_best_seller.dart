import 'package:bookly_app_with_clean_architure/core/utils/app_style.dart';
import 'package:flutter/material.dart';

class RatingBestSeller extends StatelessWidget {
  final MainAxisAlignment mainAxisAlignment;
  final num rateingNumbers;
  const RatingBestSeller({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.rateingNumbers = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(Icons.star, color: Color(0xffFFDD4F)),
        const SizedBox(width: 6.3),
        Text(
          "4.0",
          style: AppStyle.textStyle16Medium.copyWith(color: Colors.white),
        ),
        const SizedBox(width: 5),
        Text("($rateingNumbers)", style: AppStyle.textStyle14Regular),
      ],
    );
  }
}
