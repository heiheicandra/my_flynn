import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_flynn/presentation/not_found/not_found_page.dart';
import 'package:my_flynn/presentation/profile/controller/profile_binding.dart';
import 'package:my_flynn/presentation/profile/view/profile_page.dart';
import 'package:my_flynn/presentation/splash_page/controller/splash_page_binding.dart';
import 'package:my_flynn/presentation/splash_page/view/splash_page.dart';

class AppRoute {
  static final List<GetPage> routes = [
    GetPage(
      name: SplashPage.routeName,
      page: () => const SplashPage(),
      binding: SplashPageBinding(),
      // binding: BindingsBuilder(() {
      //   SplashPageBinding().dependencies();
      // }),
    ),
    GetPage(
      name: ProfilePage.routeName,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
      // binding: BindingsBuilder(() {
      //   ProfileBinding().dependencies();
      // }),
    ),
    GetPage(
      name: NotFoundPage.routeName,
      page: () => const NotFoundPage(),
    ),
  ];
}
