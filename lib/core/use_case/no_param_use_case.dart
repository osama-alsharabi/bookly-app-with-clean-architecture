import 'package:bookly_app_with_clean_architure/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class NoParamUseCase<Type> {
  Future<Either<Failure, Type>> call();
}
