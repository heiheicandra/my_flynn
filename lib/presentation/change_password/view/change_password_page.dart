//coverage:ignore-file
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:my_flynn/common_widgets/app_form_field.dart";
import "package:my_flynn/common_widgets/shared_button.dart";
import "package:my_flynn/utils/bool_extension.dart";
import "../controller/change_password_controller.dart";

class ChangePasswordPage extends GetView<ChangePasswordControllerInterface> {
  static const String routeName = "/changePassword-page";

  const ChangePasswordPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          '비밀번호 설정',
          /* Password Setting */
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: controller.viewModel.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                final isObscure =
                    controller.viewModel.currentPasswordObscure.value;
                return AppFormField(
                  controller: controller.viewModel.currentPasswordController,
                  label: '기본 비밀번호 *' /* Current Password */,
                  hintText:
                      '8-16자리 영문, 숫자, 특수문자 조합' /* 8–16 letters, numbers, special characters */,
                  obscureText: isObscure,
                  suffix: IconButton(
                    onPressed: controller.toggleCurrentPasswordObscure,
                    icon: isObscure.either(
                      trueV: () => const Icon(Icons.visibility_outlined),
                      falseV: () => const Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                  validator: controller.validateCurrent,
                );
              }),
              const SizedBox(height: 16),
              Obx(() {
                final isObscure = controller.viewModel.newPasswordObscure.value;
                return AppFormField(
                  controller: controller.viewModel.newPasswordController,
                  label: '새 비밀번호 *' /* New Password */,
                  hintText:
                      '8-16자리 영문, 숫자, 특수문자 조합' /* 8–16 letters, numbers, special characters */,
                  obscureText: isObscure,
                  suffix: IconButton(
                    onPressed: controller.toggleNewPasswordObscure,
                    icon: isObscure.either(
                      trueV: () => const Icon(Icons.visibility_outlined),
                      falseV: () => const Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                  validator: controller.validateNew,
                );
              }),
              const SizedBox(height: 16),
              Obx(() {
                final isObscure =
                    controller.viewModel.confirmPasswordObscure.value;
                return AppFormField(
                  controller: controller.viewModel.confirmPasswordController,
                  label: '비밀번호 확인 *' /* Confirm Password */,
                  hintText:
                      '비밀번호를 재입력해 주세요.' /* Please re-enter your password */,
                  obscureText: isObscure,
                  suffix: IconButton(
                    onPressed: controller.toggleConfirmPasswordObscure,
                    icon: isObscure.either(
                      trueV: () => const Icon(Icons.visibility_outlined),
                      falseV: () => const Icon(Icons.visibility_off_outlined),
                    ),
                  ),
                  validator: controller.validateConfirm,
                );
              }),
              const Spacer(),
              Obx(() {
                final isButtonEnabled =
                    controller.viewModel.isButtonEnabled.value;
                return AppButton(
                  title: '완료' /* Done */,
                  isDisabled: !isButtonEnabled,
                  onPressed: () {
                    if (controller.viewModel.formKey?.currentState
                            ?.validate() ??
                        false) {
                      Get.snackbar(
                        "Saved",
                        "Button CLicked",
                        backgroundColor: Colors.green,
                        icon: const Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                      );
                    }
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
