import 'package:bookly_app_with_clean_architure/core/errors/failure.dart';
import 'package:bookly_app_with_clean_architure/core/use_case/use_case.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_featured_books_param.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase
    extends UseCase<List<BookEntity>, FetchFeaturedBooksParam> {
  final HomeRepository homeRepository;

  FetchFeaturedBooksUseCase({required this.homeRepository});

  @override
  Future<Either<Failure, List<BookEntity>>> call([
    FetchFeaturedBooksParam? param,
  ]) async {
    return await homeRepository.fetchFeaturedBooks(fetchParam: param!);
  }
}
