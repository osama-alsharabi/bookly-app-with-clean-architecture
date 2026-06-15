import 'package:bookly_app_with_clean_architure/core/helpers/hive_init.dart';
import 'package:bookly_app_with_clean_architure/core/routes/app_router_config.dart';
import 'package:bookly_app_with_clean_architure/core/services/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  await dotenv.load();
  await setupServiceLocator();
  await hiveInit();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xff100B20),
        textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
      ),
      routerConfig: AppRouterConfig.router,
    );
  }
}
