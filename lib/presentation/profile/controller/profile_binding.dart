import 'package:my_flynn/presentation/profile/service/profile_service.dart';
import "profile_controller.dart";
import "package:get/get.dart";

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    ProfileService profileService = ProfileService();
    ProfileControllerInterface controller = ProfileController(
      profileService: profileService,
    ) as ProfileControllerInterface;

    Get.put<ProfileControllerInterface>(controller);
  }
}
