import 'package:bookly_app_with_clean_architure/core/errors/failure.dart';
import 'package:bookly_app_with_clean_architure/core/utils/app_const.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_featured_books_param.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImp extends HomeRepository {
  final HomeLocalDataSource homeLocalDataSource;
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeRepositoryImp({
    required this.homeLocalDataSource,
    required this.homeRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({
    required FetchFeaturedBooksParam fetchParam,
  }) async {
    List<BookEntity> books;
    try {
      books = homeLocalDataSource.getFeaturedBooks(param: fetchParam);
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks(
        fetchParam: fetchParam,
      );
      homeLocalDataSource.cacheBooks(
        boxName: AppConst.featuredBooksHiveBox,
        data: books,
      );
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(
        ServerFailure(message: "there was an error, please try later"),
      );
    }
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewestBooks() async {
    List<BookEntity> books;
    try {
      books = homeLocalDataSource.getNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();

      homeLocalDataSource.cacheBooks(
        boxName: AppConst.newestBooksHiveBox,
        data: books,
      );
      return right(books);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } catch (e) {
      return left(
        ServerFailure(message: "there was an error, please try later"),
      );
    }
  }
}
