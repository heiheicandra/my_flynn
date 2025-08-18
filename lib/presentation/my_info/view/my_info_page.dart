import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:my_flynn/presentation/my_info/widgets/my_info_item.dart";
import "package:my_flynn/utils/num_extension.dart";

class MyInfoPage extends StatelessWidget {
  static const String routeName = "/myInfo-page";

  const MyInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          '내정보' /* My Profile/My Info*/,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 2.h(context)),
            MyInfoItem(
              title: '기본 정보' /* Basic Information*/,
              onTap: () {
                debugPrint('기본 정보 tapped');
              },
            ),
            SizedBox(height: 1.h(context)),
            MyInfoItem(
              title: '비밀번호 설정' /* Password Settings*/,
              onTap: () {
                debugPrint('비밀번호 설정 tapped');
              },
            ),
            SizedBox(height: 1.h(context)),
            MyInfoItem(
              title: '관심 카테고리' /* Interest Categories*/,
              onTap: () {
                debugPrint('관심 카테고리 tapped');
              },
            ),
          ],
        ),
      ),
    );
  }
}
