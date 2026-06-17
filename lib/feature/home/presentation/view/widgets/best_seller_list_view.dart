import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/best_seller_item.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/newest_books_item_loading_indectator.dart';
import 'package:flutter/material.dart';

class BestSellerListView extends StatelessWidget {
  final List<BookEntity> books;
  final bool isLoadingPagination;

  const BestSellerListView({
    super.key,
    required this.books,
    this.isLoadingPagination = false,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: books.length, (
        context,
        index,
      ) {
        final isLastTwoItems = index >= books.length - 2 && isLoadingPagination;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: isLastTwoItems
              ? const NewestBooksItemLoadingIndectator()
              : BestSellerItem(book: books[index]),
        );
      }),
    );
  }
}
