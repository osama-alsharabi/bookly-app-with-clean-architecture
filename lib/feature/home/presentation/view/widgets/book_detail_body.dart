import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/book_details_app_bar.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/book_details_section.dart';
import 'package:flutter/material.dart';

class BookDetailBody extends StatelessWidget {
  const BookDetailBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 20),
        BookDetailsAppBar(),
        SizedBox(height: 32),
        BookDetailsSection(),
      ],
    );
  }
}
