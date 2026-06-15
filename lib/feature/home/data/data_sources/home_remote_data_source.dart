import 'package:bookly_app_with_clean_architure/feature/home/data/model/book_model/book_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookModel>> fetchFeaturedBooks();
  Future<List<BookModel>> fetchNewestBooks();
}