import 'package:my_flynn/presentation/campaign/service/campaign_service.dart';
import "campaign_controller.dart";
import "package:get/get.dart";

class CampaignBinding extends Bindings {
  @override
  void dependencies() {
    CampaignService campaignService = CampaignServiceImpl();
    CampaignControllerInterface controller = CampaignController(
      campaignService: campaignService,
    ) as CampaignControllerInterface;

    Get.put<CampaignControllerInterface>(controller);
  }
}
