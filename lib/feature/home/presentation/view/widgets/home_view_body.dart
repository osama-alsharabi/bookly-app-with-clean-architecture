import 'package:bookly_app_with_clean_architure/core/utils/app_style.dart';
import 'package:bookly_app_with_clean_architure/feature/home/domain/use_cases/params/fetch_newest_books_param.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/featured_list_view_bloc_builder.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/widgets/newest_list_view_bloc_builder.dart';
import 'package:bookly_app_with_clean_architure/feature/home/presentation/view_model/fetch_newest_books/fetch_newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final ScrollController newestController;
  late bool isLoadingPage;
  int nextPage = 0;
  @override
  void initState() {
    super.initState();
    isLoadingPage = false;
    newestController = ScrollController();
    newestController.addListener(() async {
      await fetchNewestBooksPagination();
    });
  }

  Future<void> fetchNewestBooksPagination() async {
    if (newestController.position.pixels >=
            newestController.position.maxScrollExtent * 0.7 &&
        !isLoadingPage) {
      isLoadingPage = true;
      await BlocProvider.of<FetchNewestBooksCubit>(
        context,
      ).fetchNewsetBooks(param: FetchNewestBooksParam(pageNumber: ++nextPage));
      isLoadingPage = false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    newestController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: newestController,
      slivers: [
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        const SliverToBoxAdapter(child: CustomAppBar()),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        const SliverToBoxAdapter(child: FeaturedListViewBlocBuilder()),
        const SliverToBoxAdapter(child: SizedBox(height: 50)),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: Text("Best Seller", style: AppStyle.textStyle18SimeBold),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        const NewestListViewBlocBuilder(),
      ],
    );
  }
}
