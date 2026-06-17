import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/newest_books_list_view_loading_indecator.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_newest_books/fetch_newest_books_cubit.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_newest_books/fetch_newest_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListViewBlocBuilder extends StatefulWidget {
  const NewestListViewBlocBuilder({super.key});

  @override
  State<NewestListViewBlocBuilder> createState() =>
      _NewestListViewBlocBuilderState();
}

class _NewestListViewBlocBuilderState extends State<NewestListViewBlocBuilder> {
  List<BookEntity> books = [];
  bool isloadingPagination = false;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchNewestBooksCubit, FetchNewestBooksState>(
      listener: (context, state) {
        if (state is FetchNewestBooksSuccess) {
          books.addAll(state.books);
        }
        if (state is FetchNewestBooksPaginationLoading) {
          isloadingPagination = true;
        } else {
          isloadingPagination = false;
        }
      },
      builder: (context, state) {
        if (state is FetchNewestBooksSuccess ||
            state is FetchNewestBooksPaginationLoading) {
          return BestSellerListView(
            books: books,
            isLoadingPagination: isloadingPagination,
          );
        } else if (state is FetchNewestBooksFailure) {
          return SliverToBoxAdapter(child: Text(state.errorMessage));
        } else {
          return const SliverToBoxAdapter(
            child: NewestBooksListViewLoadingIndecator(),
          );
        }
      },
    );
  }
}
