import 'package:bookly_app_with_clean_architure/core/errors/failure.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_featured_books/fetch_featured_books_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState> {
  FetchFeaturedBooksCubit({required this.featuredBooksUseCase})
    : super(FetchFeaturedBooksInitial());
  final FetchFeaturedBooksUseCase featuredBooksUseCase;

  Future<void> fetchFeaturedBooks() async {
    emit(FetchFeaturedBooksLoading());
    Either<Failure, List<BookEntity>> result = await featuredBooksUseCase
        .call();
    result.fold(
      (failure) =>
          emit(FetchFeaturedBooksFailure(errorMessage: failure.message)),
      (books) => emit(FetchFeaturedBooksSuccess(books: books)),
    );
  }
}
