import 'package:bookly_app_with_clean_architure/feature/home/data/model/book_model/book_model.dart';

abstract class HomeLocalDataSource {
  List<BookModel> getFeaturedBooks();
  List<BookModel> getNewestBooks();
}
