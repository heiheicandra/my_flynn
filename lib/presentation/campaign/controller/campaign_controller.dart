import 'package:my_flynn/presentation/campaign/service/campaign_service.dart';
import 'package:my_flynn/presentation/campaign/model/campaign_viewmodel.dart';
import "package:get/get.dart";
import 'package:my_flynn/utils/case_state.dart';

abstract class CampaignControllerRepository {
  late final CampaignService campaignService;
}

abstract class CampaignControllerInterface {
  late CampaignViewModel viewModel;
}

class CampaignController extends GetxController
    implements CampaignControllerRepository, CampaignControllerInterface {
  @override
  var viewModel = CampaignViewModel();

  @override
  late final CampaignService campaignService;

  CampaignController({
    required this.campaignService,
  });

  @override
  void onInit() {
    getAppliedList();
    getInProgressList();
    getCompletedList();
    super.onInit();
  }

  Future<void> getAppliedList() async {
    viewModel.appliedList.value = LoadingCase();
    final result = await campaignService.getApplied();
    viewModel.appliedList.value = LoadedCase(result);
  }

  Future<void> getInProgressList() async {
    viewModel.inProgressList.value = LoadingCase();
    final result = await campaignService.getInProgress();
    viewModel.inProgressList.value = LoadedCase(result);
  }

  Future<void> getCompletedList() async {
    viewModel.completedList.value = LoadingCase();
    final result = await campaignService.getCompleted();
    viewModel.completedList.value = LoadedCase(result);
  }
}
