import 'package:bookly_app_with_clean_architure/core/utils/app_const.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  cacheBooks({required List<BookEntity> data, required String boxName}) async {
    final box = Hive.box<BookEntity>(boxName);
    box.clear();
    box.addAll(data);
  }

  @override
  List<BookEntity> getFeaturedBooks() {
    final data = Hive.box<BookEntity>(AppConst.featuredBooksHiveBox);
    return data.values.toList();
  }

  @override
  List<BookEntity> getNewestBooks() {
    final data = Hive.box<BookEntity>(AppConst.newestBooksHiveBox);
    return data.values.toList();
  }
}
