import 'package:bookly_app_with_clean_architure/feature/home/presentation/view/home_view.dart';
import 'package:bookly_app_with_clean_architure/feature/splash/presentation/view/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouterConfig {
  static const String homeViewRouter = "homeView";
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(
        name: homeViewRouter,
        path: '/$homeViewRouter',
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
