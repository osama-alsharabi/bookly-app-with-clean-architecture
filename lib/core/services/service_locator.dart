import 'package:bookly_app_with_clean_architure/core/services/api_service.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/data_sources/home_local_data_source_imp.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/data_sources/home_remote_data_source_imp.dart';
import 'package:bookly_app_with_clean_architure/feature/home/data/repositories/home_repository_imp.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/fetch_featured_books_use_case.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_featured_books/fetch_featured_books_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setupServiceLocator() {
   getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));

 
  getIt.registerSingleton<HomeRemoteDataSourceImp>(
    HomeRemoteDataSourceImp(apiService: getIt.get<ApiService>()),
  );
  getIt.registerSingleton<HomeLocalDataSourceImp>(HomeLocalDataSourceImp());
   getIt.registerSingleton<HomeRepositoryImp>(
    HomeRepositoryImp(
      homeRemoteDataSource: getIt.get<HomeRemoteDataSourceImp>(),
      homeLocalDataSource: getIt.get<HomeLocalDataSourceImp>(),
    ),
  );
   getIt.registerSingleton<FetchFeaturedBooksUseCase>(
    FetchFeaturedBooksUseCase(homeRepository: getIt.get<HomeRepositoryImp>()),
  );
  getIt.registerSingleton<FetchFeaturedBooksCubit>(
    FetchFeaturedBooksCubit(
      featuredBooksUseCase: getIt<FetchFeaturedBooksUseCase>(),
    ),
  );


  
}
