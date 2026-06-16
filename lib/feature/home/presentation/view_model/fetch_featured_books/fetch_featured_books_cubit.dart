import 'package:bookly_app_with_clean_architure/core/errors/failure.dart';
import 'package:bookly_app_with_clean_architure/core/helpers/safe_cubit.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_featured_books_param.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_featured_books/fetch_featured_books_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState>
    with SafeCubit {
  FetchFeaturedBooksCubit({required this.featuredBooksUseCase})
    : super(FetchFeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks({FetchFeaturedBooksParam? param}) async {
    int pageNumber = param?.paginationNumber ?? 0;
    if (pageNumber == 0) {
      await Future.delayed(
        const Duration(milliseconds: 1500),
        () => safeEmit(FetchFeaturedBooksLoading()),
      );
    } else {
      safeEmit(FetchFeaturedBooksPaginationLoading());
    }
    Either<Failure, List<BookEntity>> result = await featuredBooksUseCase.call(
      param ?? FetchFeaturedBooksParam(),
    );
    result.fold(
      (failure) =>
          safeEmit(FetchFeaturedBooksFailure(errorMessage: failure.message)),
      (books) => safeEmit(FetchFeaturedBooksSuccess(books: books)),
    );
  }
}
