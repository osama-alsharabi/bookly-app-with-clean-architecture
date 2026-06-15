import 'package:bookly_app_with_clean_architure/core/utils/app_style.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/action_buttons_book_details.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/custom_book_image.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/rating_best_seller.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  final BookEntity book;
  const BookDetailsSection({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.45,
          child: CustomBookImage(image: book.image),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Text(
            book.title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: AppStyle.textStyle30Regular.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.author,
            style: AppStyle.textStyle18Medium.copyWith(color: Colors.white),
          ),
        ),
        const SizedBox(height: 15),
        RatingBestSeller(
          rateingNumbers: book.rating,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 38.0),
          child: ActionButtonsBookDetails(book: book),
        ),
      ],
    );
  }
}
