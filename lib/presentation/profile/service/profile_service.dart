import 'package:my_flynn/presentation/profile/model/profile_statistic.dart';

abstract class ProfileServiceInterface {
  Future<String> getName();
  Future<ProfileStatistic> getStatistic();
}

class ProfileService implements ProfileServiceInterface {
  @override
  Future<String> getName() async {
    // API SIMULATION
    await Future.delayed(const Duration(milliseconds: 3000));
    return '홍길동님'; //John Smith
  }

  @override
  Future<ProfileStatistic> getStatistic() async {
    // API SIMULATION
    await Future.delayed(const Duration(milliseconds: 3000));
    return ProfileStatistic(
      applied: 1,
      inProgress: 2,
      completed: 3,
    );
  }
}
