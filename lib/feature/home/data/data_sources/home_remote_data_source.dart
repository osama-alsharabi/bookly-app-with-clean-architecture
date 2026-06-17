import 'package:bookly_app_with_clean_architure/feature/home/data/model/book_model/book_model.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_featured_books_param.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_newest_books_param.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookModel>> fetchFeaturedBooks({
    required FetchFeaturedBooksParam fetchParam,
  });
  Future<List<BookModel>> fetchNewestBooks({
    required FetchNewestBooksParam fetchParam,
  });
}
