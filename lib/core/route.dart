import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_flynn/presentation/campaign/controller/campaign_binding.dart';
import 'package:my_flynn/presentation/campaign/view/campaign_page.dart';
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
    ),
    GetPage(
      name: ProfilePage.routeName,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: CampaignPage.routeName,
      page: () => const CampaignPage(),
      binding: CampaignBinding(),
    ),
    GetPage(
      name: NotFoundPage.routeName,
      page: () => const NotFoundPage(),
    ),
  ];
}
