import 'package:bookly_app_with_clean_architure/core/services/api_service.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/model/book_model/book_model.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImp({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeaturedBooks() async {
    var books = await apiService.get(endPoint: "volumes?q=flutter");
    List<BookModel> book = getBooks(books);
    return book;
  }

  List<BookModel> getBooks(Map<String, dynamic> books) {
    List<BookModel> book = books["items"]
        .map((e) => BookModel.fromJson(e))
        .toList();
    return book;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks() async {
    var books = await apiService.get(endPoint: "volumes?q=programming");
    List<BookModel> book = getBooks(books);
    return book;
  }
}
