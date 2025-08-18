import "package:get/get.dart";
import "package:my_flynn/presentation/campaign/model/campaign_resp.dart";
import "package:my_flynn/utils/case_state.dart";

class CampaignViewModel {
  final appliedList = Case<List<CampaignResp>>().obs;
  final inProgressList = Case<List<CampaignResp>>().obs;
  final completedList = Case<List<CampaignResp>>().obs;
}
