import 'package:bookly_app_with_clean_architure/core/services/api_service.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/model/book_model/book_model.dart';

class HomeRemoteDataSourceImp extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImp({required this.apiService});
  @override
  Future<List<BookModel>> fetchFeaturedBooks() async {
    var data = await apiService.get(endPoint: "volumes?q=flutter");
    List<BookModel> book = getBooks(data);
    return book;
  }

  List<BookModel> getBooks(Map<String, dynamic> data) {
    return (data["items"] as List).map((e) => BookModel.fromJson(e)).toList();
  }

  @override
  Future<List<BookModel>> fetchNewestBooks() async {
    var books = await apiService.get(endPoint: "volumes?q=programming");
    List<BookModel> book = getBooks(books);
    return book;
  }
}
