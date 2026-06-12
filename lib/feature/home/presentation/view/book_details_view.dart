import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/book_detail_body.dart';
import 'package:flutter/material.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: BookDetailBody()));
  }
}
