import 'package:bookly_app_with_clean_architure/core/utils/app_style.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/custom_book_image.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/rating_best_seller.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.45,
          child: const CustomBookImage(),
        ),
        const SizedBox(height: 40),
        Text(
          "The Jungle Book",
          style: AppStyle.textStyle30Regular.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            "Rudyard Kipling",
            style: AppStyle.textStyle18Medium.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 15),
        const RatingBestSeller(mainAxisAlignment: MainAxisAlignment.center),
      ],
    );
  }
}
