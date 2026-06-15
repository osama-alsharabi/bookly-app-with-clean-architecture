import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/book_details_app_bar.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/book_details_section.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/similer_books_section.dart';
import 'package:flutter/material.dart';

class BookDetailBody extends StatelessWidget {
  final BookEntity book;
  const BookDetailBody({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          const BookDetailsAppBar(),
          const SizedBox(height: 32),
          BookDetailsSection(book: book),
          const FittedBox(fit: BoxFit.scaleDown, child: SizedBox(height: 50)),
          const SimilerBooksSection(),
        ],
      ),
    );
  }
}
