import 'package:my_flynn/presentation/campaign/model/campaign_resp.dart';

abstract class CampaignService {
  Future<List<CampaignResp>> getApplied();
  Future<List<CampaignResp>> getInProgress();
  Future<List<CampaignResp>> getCompleted();
}

class CampaignServiceImpl implements CampaignService {
  @override
  Future<List<CampaignResp>> getApplied() async {
    // API SIMULATION
    await Future.delayed(const Duration(milliseconds: 3000));
    return List.generate(5, (index) {
      return CampaignResp(
        imageUrl: "https://picsum.photos/200",
        title: "회사명 나오는 자리" /*Company Name*/,
        subTitle: "소개말 나오는 자리입니다. 한줄만 나옵니다." /*Description*/,
        tags: [
          "F&B",
          "패션" /*Fashion*/,
          "육아/키즈" /*Parenting/Kids*/,
          "리빙/인테리어" /*Living/Interior*/
        ],
      );
    });
  }

  @override
  Future<List<CampaignResp>> getCompleted() async {
    // API SIMULATION
    await Future.delayed(const Duration(milliseconds: 3000));
    return List.generate(5, (index) {
      return CampaignResp(
        imageUrl: "https://picsum.photos/200",
        title: "회사명 나오는 자리" /*Company Name*/,
        subTitle: "소개말 나오는 자리입니다. 한줄만 나옵니다." /*Description*/,
        tags: [
          "F&B",
          "패션" /*Fashion*/,
          "육아/키즈" /*Parenting/Kids*/,
          "리빙/인테리어" /*Living/Interior*/
        ],
      );
    });
  }

  @override
  Future<List<CampaignResp>> getInProgress() async {
    // API SIMULATION
    await Future.delayed(const Duration(milliseconds: 3000));
    return List.generate(5, (index) {
      return CampaignResp(
        imageUrl: "https://picsum.photos/200",
        title: "회사명 나오는 자리" /*Company Name*/,
        subTitle: "소개말 나오는 자리입니다. 한줄만 나옵니다." /*Description*/,
        tags: [
          "F&B",
          "패션" /*Fashion*/,
          "육아/키즈" /*Parenting/Kids*/,
          "리빙/인테리어" /*Living/Interior*/
        ],
      );
    });
  }
  //
}
