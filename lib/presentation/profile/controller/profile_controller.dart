import 'package:my_flynn/presentation/profile/service/profile_service.dart';
import 'package:my_flynn/presentation/profile/model/profile_viewmodel.dart';
import "package:get/get.dart";
import 'package:my_flynn/utils/case_state.dart';

abstract class ProfileControllerRepository {
  late final ProfileServiceInterface profileService;
}

abstract class ProfileControllerInterface {
  late ProfileViewModel viewModel;
}

class ProfileController extends GetxController
    implements ProfileControllerRepository, ProfileControllerInterface {
  @override
  var viewModel = ProfileViewModel();

  @override
  late final ProfileServiceInterface profileService;

  ProfileController({
    required this.profileService,
  });

  @override
  void onInit() {
    getName();
    getStatistic();
    super.onInit();
  }

  Future<void> getName() async {
    viewModel.personName.value = LoadingCase();
    final result = await profileService.getName();
    viewModel.personName.value = LoadedCase(result);
  }

  Future<void> getStatistic() async {
    viewModel.statistic.value = LoadingCase();
    final result = await profileService.getStatistic();
    viewModel.statistic.value = LoadedCase(result);
  }
}
