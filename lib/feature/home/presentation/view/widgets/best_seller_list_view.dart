  import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
  import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/best_seller_item.dart';
  import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/newest_books_item_loading_indectator.dart';
  import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_newest_books/fetch_newest_books_cubit.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_bloc/flutter_bloc.dart';

  class BestSellerListView extends StatelessWidget {
    final List<BookEntity> books;
    final bool isLoadingPagination;
    final bool isReachedLastBook;

    const BestSellerListView({
      super.key,
      required this.books,
      this.isLoadingPagination = false,
      this.isReachedLastBook = false,
    });

    @override
    Widget build(BuildContext context) {
      return SliverList(
        delegate: SliverChildBuilderDelegate(childCount: books.length, (
          context,
          index,
        ) {
          final isLastTwoItems = index >= books.length - 2 && isLoadingPagination;
          if (index == books.length + 1) {
            BlocProvider.of<FetchNewestBooksCubit>(context).isReachedLastBook ==
                true;
          }
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
