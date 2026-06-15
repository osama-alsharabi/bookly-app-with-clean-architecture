import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure({required this.message});
}

class ServerFailure extends Failure {
  ServerFailure({required super.message});

  factory ServerFailure.fromDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          message: 'انتهت مهلة الاتصال بالخادم، حاول مرة أخرى.',
        );

      case DioExceptionType.sendTimeout:
        return ServerFailure(
          message: 'استغرق إرسال الطلب وقتًا أطول من المتوقع.',
        );

      case DioExceptionType.receiveTimeout:
        return ServerFailure(
          message: 'الخادم استغرق وقتًا طويلًا في الاستجابة.',
        );

      case DioExceptionType.badCertificate:
        return ServerFailure(
          message: 'هناك مشكلة في شهادة الأمان الخاصة بالخادم.',
        );

      case DioExceptionType.cancel:
        return ServerFailure(message: 'تم إلغاء الطلب.');

      case DioExceptionType.connectionError:
        return ServerFailure(
          message: 'لا يوجد اتصال بالإنترنت، تحقق من الشبكة.',
        );

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          e.response?.statusCode,
          e.response?.data,
        );

      case DioExceptionType.unknown:
        return ServerFailure(message: 'حدث خطأ غير متوقع، حاول مرة أخرى.');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    switch (statusCode) {
      case 400:
        return ServerFailure(message: 'الطلب غير صحيح.');

      case 401:
        return ServerFailure(message: 'يجب تسجيل الدخول أولاً.');

      case 403:
        return ServerFailure(message: 'ليس لديك صلاحية للوصول إلى هذا المورد.');

      case 404:
        return ServerFailure(message: 'المحتوى المطلوب غير موجود.');

      case 429:
        return ServerFailure(
          message: 'تم تجاوز الحد المسموح من الطلبات، حاول لاحقًا.',
        );

      case 500:
        return ServerFailure(message: 'حدث خطأ في الخادم، حاول لاحقًا.');

      case 502:
      case 503:
      case 504:
        return ServerFailure(message: 'الخدمة غير متاحة حاليًا.');

      default:
        return ServerFailure(message: 'حدث خطأ غير متوقع.');
    }
  }
}
