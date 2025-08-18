import "package:flutter/material.dart";
import "package:get/get.dart";
import 'package:my_flynn/presentation/campaign/controller/campaign_controller.dart';
import "package:my_flynn/presentation/campaign/view/applied_list.dart";
import "package:my_flynn/presentation/campaign/view/completed_list.dart";
import "package:my_flynn/presentation/campaign/view/in_progress_list.dart";
import "package:my_flynn/utils/case_state.dart";
import "package:my_flynn/utils/color_scheme.dart";

class CampaignPage extends GetView<CampaignControllerInterface> {
  static const String routeName = "/campaign-page";

  const CampaignPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BackButton(color: Colors.black),
          title: const Text(
            "캠페인 매칭" /*Campaign Matching*/,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          bottom: const TabBar(
            indicatorColor: AppColor.primary,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(text: "신청" /*Apply*/),
              Tab(text: "진행중" /*In Progress*/),
              Tab(text: "완료" /*Completed*/),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Obx(() {
              final state = controller.viewModel.appliedList.value;
              return AppliedList(
                data: state.data,
                isLoading: state is LoadingCase,
              );
            }),
            Obx(() {
              final state = controller.viewModel.inProgressList.value;
              return InProgressList(
                  data: state.data, isLoading: state is LoadingCase);
            }),
            Obx(() {
              final state = controller.viewModel.completedList.value;
              return CompletedList(
                data: state.data,
                isLoading: state is LoadingCase,
              );
            }),
          ],
        ),
      ),
    );
  }
}
