import 'package:bookly_app_with_clean_architure/core/errors/failure.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_featured_books_param.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_newest_books_param.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({
    required FetchFeaturedBooksParam fetchParam,
  });
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks({
    required FetchNewestBooksParam fetchParam,
  });
}
