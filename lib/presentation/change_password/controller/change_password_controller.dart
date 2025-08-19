import 'package:flutter/material.dart';
import 'package:my_flynn/presentation/change_password/model/change_password_viewmodel.dart';
import "package:get/get.dart";

abstract class ChangePasswordControllerInterface {
  late ChangePasswordViewModel viewModel;

  void validateForm();
  void toggleCurrentPasswordObscure();
  void toggleNewPasswordObscure();
  void toggleConfirmPasswordObscure();

  String? validateCurrent(String? value);
  String? validateNew(String? value);
  String? validateConfirm(String? value);
}

class ChangePasswordController extends GetxController
    implements ChangePasswordControllerInterface {
  @override
  var viewModel = ChangePasswordViewModel();

  ChangePasswordController();

  @override
  void onInit() {
    viewModel.formKey = GlobalKey<FormState>();
    viewModel.currentPasswordController = TextEditingController();
    viewModel.newPasswordController = TextEditingController();
    viewModel.confirmPasswordController = TextEditingController();
    super.onInit();
  }

  @override
  void validateForm() {
    viewModel.isButtonEnabled.value =
        viewModel.currentPasswordController?.text.isNotEmpty == true &&
            viewModel.newPasswordController?.text.isNotEmpty == true &&
            viewModel.confirmPasswordController?.text.isNotEmpty == true;
  }

  @override
  void onClose() {
    viewModel.currentPasswordController?.dispose();
    viewModel.newPasswordController?.dispose();
    viewModel.confirmPasswordController?.dispose();
    super.onClose();
  }

  @override
  void toggleConfirmPasswordObscure() {
    viewModel.confirmPasswordObscure.value =
        !viewModel.confirmPasswordObscure.value;
  }

  @override
  void toggleCurrentPasswordObscure() {
    viewModel.currentPasswordObscure.value =
        !viewModel.currentPasswordObscure.value;
  }

  @override
  void toggleNewPasswordObscure() {
    viewModel.newPasswordObscure.value = !viewModel.newPasswordObscure.value;
  }

  @override
  String? validateCurrent(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your current password';
    }
    return null;
  }

  @override
  String? validateNew(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your new password';
    }
    if (value.length < 8 || value.length > 16) {
      return 'Password must be 8–16 characters';
    }
    if (!RegExp(r'[A-Za-z]').hasMatch(value)) {
      return 'Must include a letter.';
    }
    if (!RegExp(r'\d').hasMatch(value)) {
      return 'Must include a number.';
    }
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Must include a special character';
    }
    return null;
  }

  @override
  String? validateConfirm(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please re-enter your password';
    }
    if (value != viewModel.newPasswordController?.text) {
      return 'Passwords do not match';
    }
    return null;
  }
}
