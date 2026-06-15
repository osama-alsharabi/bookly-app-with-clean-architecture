import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/book_detail_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  final BookEntity book;
  const BookDetailsView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(body: SafeArea(child: BookDetailBody(book: book,)));
  }
}
