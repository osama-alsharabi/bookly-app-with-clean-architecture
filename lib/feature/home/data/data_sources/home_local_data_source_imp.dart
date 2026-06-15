import 'package:bookly_app_with_clean_architure/core/utils/app_const.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/model/book_model/book_model.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

class HomeLocalDataSourceImp extends HomeLocalDataSource {
  @override
  cacheBooks({required List<BookEntity> data, required String boxName}) async {
    final box = Hive.box(boxName);
    box.clear();
    box.add(data);
  }

  @override
  List<BookModel> getFeaturedBooks() {
    final data = Hive.box<BookModel>(AppConst.featuredBooksHiveBox);
    return data.values.toList();
  }

  @override
  List<BookModel> getNewestBooks() {
    final data = Hive.box<BookModel>(AppConst.newestBooksHiveBox);
    return data.values.toList();
  }
}
