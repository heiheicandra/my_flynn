import "package:get/get.dart";
import "package:my_flynn/presentation/profile/model/profile_statistic.dart";
import "package:my_flynn/utils/case_state.dart";

class ProfileViewModel {
  final personName = Case<String>().obs;
  final statistic = Case<ProfileStatistic>().obs;
  final pickedImagePath = "".obs;
}
