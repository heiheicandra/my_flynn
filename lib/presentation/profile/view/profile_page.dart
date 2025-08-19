import "dart:io";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:my_flynn/common_widgets/animated_column.dart";
import "package:my_flynn/common_widgets/request_image_dialog.dart";
import "package:my_flynn/presentation/campaign/view/campaign_page.dart";
import "package:my_flynn/presentation/my_info/view/my_info_page.dart";
import "package:my_flynn/presentation/profile/model/profile_statistic.dart";
import "package:my_flynn/presentation/profile/widgets/menu_item.dart";
import "package:my_flynn/presentation/profile/widgets/stat_item.dart";
import "package:my_flynn/utils/case_state.dart";
import "package:my_flynn/utils/color_scheme.dart";
import "package:my_flynn/utils/num_extension.dart";
import 'package:my_flynn/presentation/profile/controller/profile_controller.dart';
import "package:skeletonizer/skeletonizer.dart";

class ProfilePage extends GetView<ProfileControllerInterface> {
  static const String routeName = "/profile-page";

  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 2.h(context)),
          child: AnimatedColumn(
            children: [
              // Header section with greeting and profile
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '안녕하세요,' /*Greetings,*/,
                          style: TextStyle(
                            fontSize: 16.sp(context),
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Obx(
                          () {
                            final state = controller.viewModel.personName.value;
                            final data = state.data ?? "";
                            return Skeletonizer(
                              enabled: state is LoadingCase,
                              child: Skeleton.shade(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  constraints: BoxConstraints(
                                    minWidth: 30.w(context),
                                  ),
                                  child: Text(
                                    data,
                                    maxLines: 2,
                                    textAlign: TextAlign.left,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 24.sp(context),
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.dialog(RequestImageDialog(
                          onPick: (image) {
                            controller.viewModel.pickedImagePath.value =
                                image.path;
                          },
                        ));
                      },
                      child: ClipOval(
                        child: SizedBox(
                          width: 22.w(context),
                          height: 22.w(context),
                          child: Obx(() {
                            final data =
                                controller.viewModel.pickedImagePath.value;
                            if (data.isEmpty) {
                              return ColoredBox(
                                color: Colors.grey.shade100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.camera_alt_outlined,
                                      size: 20.sp(context),
                                      color: Colors.grey.shade600,
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '이미지 등록' /*Image Registration*/,
                                      style: TextStyle(
                                        fontSize: 10.sp(context),
                                        color: Colors.grey.shade600,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Image.file(
                                File(data),
                                fit: BoxFit.cover,
                              );
                            }
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Statistics section
              Obx(
                () {
                  final state = controller.viewModel.statistic.value;
                  final data = state.data ?? ProfileStatistic();
                  return Skeletonizer(
                    enabled: state is LoadingCase,
                    ignorePointers: state is LoadingCase,
                    child: Skeleton.shade(
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed(CampaignPage.routeName);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.grey.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.grey.shade200,
                              )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '나의 관찰인' /*My Observers*/,
                                style: TextStyle(
                                  fontSize: 14.sp(context),
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ProfileStatItem(
                                    number: '${data.applied}',
                                    label: '신청' /*Applied*/,
                                    color: AppColor.primary,
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.grey.shade300,
                                    size: 28.sp(context),
                                  ),
                                  ProfileStatItem(
                                    number: '${data.inProgress}',
                                    label: '진행중' /*In Progress*/,
                                    color: AppColor.primary,
                                  ),
                                  Icon(
                                    Icons.chevron_right,
                                    color: Colors.grey.shade300,
                                    size: 28.sp(context),
                                  ),
                                  ProfileStatItem(
                                    number: '${data.completed}',
                                    label: '완료' /*Completed*/,
                                    color: AppColor.primary,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),

              SizedBox(
                height: 2.h(context),
              ),

              // Menu items
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    ProfileMenuItem(
                      onTap: () {
                        Get.toNamed(MyInfoPage.routeName);
                      },
                      icon: Icons.person_outline,
                      title: '내 정보', /*My Information*/
                    ),
                    const ProfileMenuItem(
                      icon: Icons.public,
                      title: '공지사항', /*Announcements*/
                    ),
                    const ProfileMenuItem(
                      icon: Icons.chat_bubble_outline,
                      title: '1:1문의', /*1:1 Inquiry*/
                    ),
                    const ProfileMenuItem(
                      icon: Icons.help_outline,
                      title: 'FAQ', /*FAQ*/
                    ),
                    const ProfileMenuItem(
                      icon: Icons.description_outlined,
                      title: '약관 및 정책', /*Terms and Policies*/
                    ),
                    const ProfileMenuItem(
                      icon: Icons.logout,
                      title: '로그아웃', /*Logout*/
                    ),
                    const ProfileMenuItem(
                      icon: Icons.delete_outline,
                      title: '회원탈퇴', /*Account Deletion*/
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
