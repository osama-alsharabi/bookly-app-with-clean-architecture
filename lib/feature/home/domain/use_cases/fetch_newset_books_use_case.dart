import 'package:bookly_app_with_clean_architure/core/errors/failure.dart';
import 'package:bookly_app_with_clean_architure/core/use_case/no_param_use_case.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class FetchNewsetBooksUseCase extends NoParamUseCase<List<BookEntity>> {
  final HomeRepository homeRepository;

  FetchNewsetBooksUseCase({required this.homeRepository});
  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await homeRepository.fetchNewestBooks();
  }
}
