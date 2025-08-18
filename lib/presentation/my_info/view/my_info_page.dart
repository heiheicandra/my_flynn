import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:my_flynn/common_widgets/animated_column.dart";
import "package:my_flynn/presentation/basic_info/view/basic_info_page.dart";
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
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w(context)),
        child: AnimatedColumn(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '내정보' /* My Info*/,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18.sp(context),
              ),
            ),
            SizedBox(height: 2.h(context)),
            MyInfoItem(
              title: '기본 정보' /* Basic Information*/,
              onTap: () {
                Get.toNamed(BasicInfoPage.routeName);
              },
            ),
            SizedBox(height: 1.h(context)),
            const MyInfoItem(
              title: '비밀번호 설정' /* Password Settings*/,
            ),
            SizedBox(height: 1.h(context)),
            const MyInfoItem(
              title: '관심 카테고리' /* Interest Categories*/,
            ),
          ],
        ),
      ),
    );
  }
}
