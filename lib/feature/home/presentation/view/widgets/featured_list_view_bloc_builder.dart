import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/feature_list_view.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/featured_list_view_loading_indcator.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_featured_books/fetch_featured_books_cubit.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_featured_books/fetch_featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListViewBlocBuilder extends StatefulWidget {
  const FeaturedListViewBlocBuilder({super.key});

  @override
  State<FeaturedListViewBlocBuilder> createState() =>
      _FeaturedListViewBlocBuilderState();
}

class _FeaturedListViewBlocBuilderState
    extends State<FeaturedListViewBlocBuilder> {
  final List<BookEntity> books = [];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
      listener: (context, state) {
        if (state is FetchFeaturedBooksSuccess) {
          books.addAll(state.books);
        }
      },
      builder: (context, state) {
        if (state is FetchFeaturedBooksSuccess ||
            state is FetchFeaturedBooksPaginationLoading) {
          return FeatureListView(books: books);
        } else if (state is FetchFeaturedBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const FeaturedListViewLoadingIndcator();
        }
      },
    );
  }
}
