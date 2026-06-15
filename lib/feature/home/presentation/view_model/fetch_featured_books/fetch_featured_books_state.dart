import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';

abstract class FetchFeaturedBooksState {}

final class FetchFeaturedBooksInitial extends FetchFeaturedBooksState {}

final class FetchFeaturedBooksLoading extends FetchFeaturedBooksState {}

final class FetchFeaturedBooksSuccess extends FetchFeaturedBooksState {
  final List<BookEntity> books;

  FetchFeaturedBooksSuccess({required this.books});
}

final class FetchFeaturedBooksFailure extends FetchFeaturedBooksState {
  final String errorMessage;

  FetchFeaturedBooksFailure({required this.errorMessage});
}
