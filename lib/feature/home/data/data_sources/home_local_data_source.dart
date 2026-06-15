import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';

abstract class HomeLocalDataSource {
  cacheBooks({required List<BookEntity> data, required String boxName});
  List<BookEntity> getFeaturedBooks();
  List<BookEntity> getNewestBooks();
}
