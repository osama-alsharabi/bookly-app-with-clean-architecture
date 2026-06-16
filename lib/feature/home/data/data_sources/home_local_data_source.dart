import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_featured_books_param.dart';

abstract class HomeLocalDataSource {
  cacheBooks({required List<BookEntity> data, required String boxName});
  List<BookEntity> getFeaturedBooks({required FetchFeaturedBooksParam param});
  List<BookEntity> getNewestBooks();
}
