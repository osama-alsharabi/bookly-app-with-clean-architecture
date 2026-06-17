import 'package:bookly_app_with_clean_architure/core/utils/app_const.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_featured_books_param.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_newest_books_param.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  cacheBooks({required List<BookEntity> data, required String boxName}) async {
    final box = Hive.box<BookEntity>(boxName);
    int length = box.values.toList().length;
    if (length > 150) {
      List<dynamic> deletedBooks = box.keys.take(50).toList();
      box.deleteAll(deletedBooks);
    } 
    box.addAll(data);
  }

  @override
  List<BookEntity> getFeaturedBooks({required FetchFeaturedBooksParam param}) {
    final box = Hive.box<BookEntity>(AppConst.featuredBooksHiveBox);
    final books = box.values.toList();
    final startIndex = param.paginationNumber * 10;
    final endIndex = (param.paginationNumber + 1) * 10;
    if (startIndex >= books.length) {
      return [];
    }
    final safeEndIndex = endIndex > books.length ? books.length : endIndex;
    return books.sublist(startIndex, safeEndIndex);
  }

  @override
  List<BookEntity> getNewestBooks({required FetchNewestBooksParam param}) {
    final data = Hive.box<BookEntity>(AppConst.newestBooksHiveBox);
    return data.values.toList();
  }
}
