import 'package:bookly_app_with_clean_architure/core/utils/app_const.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter();
  Hive.registerAdapter<BookEntity>(BookEntityAdapter());
  await Hive.openBox<BookEntity>(AppConst.featuredBooksHiveBox);
  await Hive.openBox<BookEntity>(AppConst.newestBooksHiveBox);
}
