import "change_password_controller.dart";
import "package:get/get.dart";

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    ChangePasswordControllerInterface controller =
        ChangePasswordController() as ChangePasswordControllerInterface;

    Get.put<ChangePasswordControllerInterface>(controller);
  }
}
