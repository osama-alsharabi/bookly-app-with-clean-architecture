import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final Dio dio;
  String baseUrl = "https://www.googleapis.com/books/v1/";
  String key = dotenv.get('Key');
  ApiService({required this.dio});

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get("$baseUrl$endPoint&key=$key");
    return response.data;
  }
}
