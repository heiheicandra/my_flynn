import "splash_page_controller.dart";
import "package:get/get.dart";

class SplashPageBinding extends Bindings {
  @override
  void dependencies() {
    SplashPageControllerInterface controller =
        SplashPageController() as SplashPageControllerInterface;

    Get.put<SplashPageControllerInterface>(controller);
  }
}
