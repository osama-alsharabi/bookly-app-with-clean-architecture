import 'dart:developer';

import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_featured_books_param.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/custom_book_image.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_featured_books/fetch_featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeatureListView extends StatefulWidget {
  final List<BookEntity> books;
  const FeatureListView({super.key, required this.books});

  @override
  State<FeatureListView> createState() => _FeatureListViewState();
}

class _FeatureListViewState extends State<FeatureListView> {
  late PageController _pageController;
  double _currentPage = 0.0;
  int paginationNumber = 1;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.45)
      ..addListener(() {
        requestPagination();
        setState(() {
          _currentPage = _pageController.page!;
        });
      });
  }

  void requestPagination() async {
    if (_pageController.position.pixels >=
        0.7 * _pageController.position.maxScrollExtent) {
      if (!_isLoading) {
        _isLoading = true;
        await BlocProvider.of<FetchFeaturedBooksCubit>(
          context,
        ).fetchFeaturedBooks(
          param: FetchFeaturedBooksParam(paginationNumber: paginationNumber++),
        );
        _isLoading = false;
      }
      log("$paginationNumber");
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.3,
      child: PageView.builder(
        itemCount: widget.books.length,
        padEnds: false,
        controller: _pageController,
        itemBuilder: (context, index) {
          double difference = index - _currentPage;
          double paddingValue = difference.abs() * 10;
          return Padding(
            padding: EdgeInsets.symmetric(
              vertical: paddingValue.clamp(0.0, 15.0),
              horizontal: 12,
            ),
            child: CustomBookImage(image: widget.books[index].image),
          );
        },
      ),
    );
  }
}
