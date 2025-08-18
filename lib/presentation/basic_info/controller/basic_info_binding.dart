import "basic_info_controller.dart";
import "package:get/get.dart";

class BasicInfoBinding extends Bindings {
  @override
  void dependencies() {
    BasicInfoControllerInterface controller =
        BasicInfoController() as BasicInfoControllerInterface;

    Get.put<BasicInfoControllerInterface>(controller);
  }
}
