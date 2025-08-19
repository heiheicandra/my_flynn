import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:my_flynn/common_widgets/app_form_field.dart";
import "package:my_flynn/common_widgets/shared_button.dart";
import "package:my_flynn/utils/num_extension.dart";
import "package:my_flynn/utils/phone_number_formatter.dart";
import 'package:my_flynn/presentation/basic_info/controller/basic_info_controller.dart';

class BasicInfoPage extends GetView<BasicInfoControllerInterface> {
  static const String routeName = "/basicInfo-page";

  const BasicInfoPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "기본정보" /* Basic Information */,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp(context),
                ),
              ),
              SizedBox(height: 2.h(context)),
              AppFormField(
                label: "아이디" /* ID */,
                mandatory: true,
                controller: controller.viewModel.idController,
                enabled: false,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  controller.buttonToggle();
                },
              ),
              AppFormField(
                label: "이메일" /* Email */,
                mandatory: true,
                controller: controller.viewModel.emailController,
                textInputAction: TextInputAction.next,
                onChanged: (value) {
                  controller.buttonToggle();
                },
              ),
              //! Phone Number start
              const FormLabel(
                label: "휴대폰 번호" /* Phone number */,
                mandatory: true,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Obx(() => AppFormField(
                          controller: controller.viewModel.phoneController,
                          textInputType:
                              const TextInputType.numberWithOptions(),
                          inputFormatters: [
                            PhoneNumberFormatter(),
                          ],
                          enabled:
                              !controller.viewModel.phoneNumberDisable.value,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            controller.buttonToggle();
                          },
                        )),
                  ),
                  SizedBox(
                    width: 5.w(context),
                  ),
                  Expanded(
                    child: AppButton(
                      title: "변경하기" /* Change */,
                      onPressed: controller.togglePhoneNUmberAvailability,
                    ),
                  ),
                ],
              ),
              //! Phone Number end
              AppFormField(
                label: "닉네임" /* Nickname */,
                controller: controller.viewModel.nicknameController,
                textInputAction: TextInputAction.next,
              ),
              AppFormField(
                label: "인스타그램 아이디" /* Instagram ID */,
                controller: controller.viewModel.instagramController,
                textInputAction: TextInputAction.next,
              ),
              AppFormField(
                label: "대표 작업 링크" /* Main work link */,
                controller: controller.viewModel.linkController,
                textInputAction: TextInputAction.done,
              ),
              AppFormField(
                label: "포트폴리오" /* Portfolio */,
                mandatory: true,
                controller: controller.viewModel.portfolioController,
                readOnly: true,
                suffix: const Icon(Icons.attach_file),
                onTap: controller.pickFile,
                onChanged: (value) {
                  controller.buttonToggle();
                },
              ),
              const SizedBox(height: 32),
              Obx(() => AppButton(
                    title: "저장하기" /* Save */,
                    isFillWidth: true,
                    borderRadius: BorderRadius.circular(12),
                    onPressed: () {
                      Get.snackbar(
                        "Saved",
                        "Button CLicked",
                        backgroundColor: Colors.green,
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                      );
                    },
                    isDisabled: !controller.viewModel.canSave.value,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
