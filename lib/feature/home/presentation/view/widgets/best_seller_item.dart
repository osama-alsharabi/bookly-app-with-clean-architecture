import 'package:bookly_app_with_clean_architure/core/routes/app_router_config.dart';
import 'package:bookly_app_with_clean_architure/core/utils/app_style.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/custom_book_image.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/rating_best_seller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  final BookEntity book;
  const BestSellerItem({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(AppRouterConfig.bookDetailViewRouter, extra: book);
      },
      child: SizedBox(
        height: 120,
        child: Row(
          children: [
            CustomBookImage(image: book.image),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    book.title,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppStyle.textStyle20Regular.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    book.author,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppStyle.textStyle14Medium.copyWith(
                      color: const Color.fromARGB(255, 168, 164, 164),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text("${book.price}€", style: AppStyle.textStyle20Bold),
                      const Spacer(),
                      RatingBestSeller(rateingNumbers: book.rating),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
