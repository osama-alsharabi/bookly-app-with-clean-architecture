import 'package:bookly_app_with_clean_architure/core/services/api_service.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/model/book_model/book_model.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_featured_books_param.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_newest_books_param.dart';

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImp({required this.apiService});
  @override
  Future<List<BookModel>> fetchFeaturedBooks({
    required FetchFeaturedBooksParam fetchParam,
  }) async {
    var data = await apiService.get(
      endPoint:
          "volumes?q=flutter&startIndex=${fetchParam.paginationNumber * 10}",
    );
    List<BookModel> book = getBooks(data);
    return book;
  }

  List<BookModel> getBooks(Map<String, dynamic> data) {
    return (data["items"] as List).map((e) => BookModel.fromJson(e)).toList();
  }

  @override
  Future<List<BookModel>> fetchNewestBooks({required FetchNewestBooksParam fetchParam}) async {
    var books = await apiService.get(endPoint: "volumes?q=programming");
    List<BookModel> book = getBooks(books);
    return book;
  }
}
