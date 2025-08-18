import "package:my_flynn/presentation/profile/view/profile_page.dart";
import 'package:my_flynn/presentation/splash_page/model/splash_page_viewmodel.dart';
import "package:get/get.dart";

abstract class SplashPageControllerRepository {
  //API SERVICE CLASSES
}

abstract class SplashPageControllerInterface {
  late SplashPageViewModel viewModel;
}

class SplashPageController extends GetxController
    implements SplashPageControllerRepository, SplashPageControllerInterface {
  @override
  var viewModel = SplashPageViewModel();

  SplashPageController();

  @override
  void onReady() {
    // API HIT SIMULATION, USUALLY FOR VERSION CHECKING
    // OR SINGLETON INITIALIZATIONS
    Future.delayed(const Duration(milliseconds: 2500)).then((_) {
      Get.toNamed(ProfilePage.routeName);
    });
    super.onReady();
  }
}
