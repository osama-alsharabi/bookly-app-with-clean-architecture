import 'package:bookly_app_with_clean_architure/core/services/service_locator.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/home_view_body.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_featured_books/fetch_featured_books_cubit.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_newest_books/fetch_newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              getIt.get<FetchFeaturedBooksCubit>()..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) =>
              getIt.get<FetchNewestBooksCubit>()..fetchNewsetBooks(),
        ),
      ],
      child: const Scaffold(body: SafeArea(child: HomeViewBody())),
    );
  }
}
