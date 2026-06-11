import 'package:bookly_app_with_clean_architure/core/utils/app_style.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/feature_image_item.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/rating_best_seller.dart';
import 'package:flutter/material.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          const FeatureImageItem(),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Harry Potter and the Goblet of Fire",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: AppStyle.textStyle20Regular.copyWith(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  "J.K. Rowling",
                  style: AppStyle.textStyle14Medium.copyWith(
                    color: const Color.fromARGB(255, 168, 164, 164),
                  ),
                ),
                const SizedBox(height: 3),
                const Row(
                  children: [
                    Text("19.99 €", style: AppStyle.textStyle20Bold),
                    Spacer(),
                    RatingBestSeller(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
