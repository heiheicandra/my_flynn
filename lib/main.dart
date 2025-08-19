import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flynn/core/route.dart';
import 'package:my_flynn/generated/fonts.gen.dart';
import 'package:my_flynn/presentation/not_found/not_found_page.dart';
import 'package:my_flynn/presentation/splash_page/view/splash_page.dart';
import 'package:my_flynn/utils/scroll_behavior.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "My Flynn",
      navigatorKey: Get.key,
      initialRoute: SplashPage.routeName,
      getPages: AppRoute.routes,
      scrollBehavior: const CustomScrollBehavior(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarThemeData(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        fontFamily: FontFamily.pretendard,
      ),
      enableLog: true,
      unknownRoute: GetPage(
        name: '/404',
        page: () => const NotFoundPage(),
      ),
      builder: (context, child) {
        return child ?? const NotFoundPage();
      },
    );
  }
}
