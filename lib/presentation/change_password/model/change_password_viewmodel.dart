import "package:flutter/material.dart";
import "package:get/get_rx/get_rx.dart";

class ChangePasswordViewModel {
  GlobalKey<FormState>? formKey;
  TextEditingController? currentPasswordController;
  TextEditingController? newPasswordController;
  TextEditingController? confirmPasswordController;

  final isButtonEnabled = false.obs;
  final currentPasswordObscure = true.obs;
  final newPasswordObscure = true.obs;
  final confirmPasswordObscure = true.obs;
}
