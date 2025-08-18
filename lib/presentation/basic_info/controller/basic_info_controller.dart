import "package:flutter/material.dart";

import 'package:my_flynn/presentation/basic_info/model/basic_info_viewmodel.dart';
import "package:get/get.dart";
import "package:my_flynn/utils/media_handler.dart";

abstract class BasicInfoControllerInterface {
  late BasicInfoViewModel viewModel;

  void togglePhoneNUmberAvailability();
  void buttonToggle();
  Future<void> pickFile();
}

class BasicInfoController extends GetxController
    implements BasicInfoControllerInterface {
  @override
  var viewModel = BasicInfoViewModel();

  BasicInfoController();

  @override
  void onInit() {
    viewModel.idController = TextEditingController(text: "asdf123");
    viewModel.emailController = TextEditingController();
    viewModel.phoneController = TextEditingController();
    viewModel.nicknameController = TextEditingController();
    viewModel.instagramController = TextEditingController();
    viewModel.linkController = TextEditingController();
    viewModel.portfolioController = TextEditingController();

    //! bypass manual form fill
    autoPopulate();

    buttonToggle();
    super.onInit();
  }

  @override
  void togglePhoneNUmberAvailability() {
    viewModel.phoneNumberDisable.value = !viewModel.phoneNumberDisable.value;
  }

  @override
  void buttonToggle() {
    viewModel.canSave.value = viewModel.idController?.text.isNotEmpty == true ||
        viewModel.emailController?.text.isNotEmpty == true ||
        viewModel.phoneController?.text.isNotEmpty == true ||
        viewModel.portfolioController?.text.isNotEmpty == true;
  }

  @override
  Future<void> pickFile() async {
    final result = (await MediaHandler.pickDocument());
    if (result != null && result.fileName.isNotEmpty) {
      viewModel.portfolioController?.text = result.fileName;
    }
  }

  void autoPopulate() {
    viewModel.emailController?.text = "asdf123@naver.com";
    viewModel.phoneController?.text = "010-1234-5678";
    viewModel.nicknameController?.text = "장발산";
    viewModel.instagramController?.text = "ffkdo_sa";
    viewModel.linkController?.text = "https://www.naver.com/";
    viewModel.portfolioController?.text = "포트폴리오.pdf";
  }
}
