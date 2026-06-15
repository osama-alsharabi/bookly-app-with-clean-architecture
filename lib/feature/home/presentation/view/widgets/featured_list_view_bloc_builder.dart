import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/feature_list_view.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_featured_books/fetch_featured_books_cubit.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_featured_books/fetch_featured_books_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedListViewBlocBuilder extends StatelessWidget {
  const FeaturedListViewBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
      builder: (context, state) {
        if (state is FetchFeaturedBooksSuccess) {
          return FeatureListView(books: state.books);
        } else if (state is FetchFeaturedBooksFailure) {
          return Text(state.errorMessage);
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
