import 'package:bookly_app_with_clean_architure/core/routes/app_router_config.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SimilerBooksListView extends StatelessWidget {
  final List<BookEntity> book;
  const SimilerBooksListView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: ListView.builder(
        itemCount: book.length,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: GestureDetector(
              onTap: () {
                context.pushNamed(
                  AppRouterConfig.bookDetailViewRouter,
                  extra: book[index],
                );
              },
              child: CustomBookImage(image: book[index].image),
            ),
          );
        },
      ),
    );
  }
}
