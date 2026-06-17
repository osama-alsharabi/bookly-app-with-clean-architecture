import 'package:bookly_app_with_clean_architure/core/errors/failure.dart';
import 'package:bookly_app_with_clean_architure/core/helpers/safe_cubit.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/entities/book_entity.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/fetch_newset_books_use_case.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_newest_books_param.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_newest_books/fetch_newest_books_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FetchNewestBooksCubit extends Cubit<FetchNewestBooksState>
    with SafeCubit {
  FetchNewestBooksCubit({required this.fetchNewsetBooksUseCase})
    : super(FetchNewestBooksInitial());
  final FetchNewsetBooksUseCase fetchNewsetBooksUseCase;

  Future<void> fetchNewsetBooks({FetchNewestBooksParam? param}) async {
    int nextPage = param?.pageNumber ?? 0;
    if (nextPage == 0) {
      safeEmit(FetchNewestBooksLoading());
    } else {
      safeEmit(FetchNewestBooksPaginationLoading());
    }
    await Future.delayed(const Duration(milliseconds: 500));
    Either<Failure, List<BookEntity>> result = await fetchNewsetBooksUseCase
        .call(param);
    result.fold(
      (failure) =>
          safeEmit(FetchNewestBooksFailure(errorMessage: failure.message)),
      (books) => safeEmit(FetchNewestBooksSuccess(books: books)),
    );
  }
}
