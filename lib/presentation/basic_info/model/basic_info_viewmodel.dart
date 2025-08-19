import "package:flutter/material.dart";
import "package:get/get.dart";

class BasicInfoViewModel {
  TextEditingController? idController;
  TextEditingController? emailController;
  TextEditingController? phoneController;
  TextEditingController? nicknameController;
  TextEditingController? instagramController;
  TextEditingController? linkController;
  TextEditingController? portfolioController;

  GlobalKey<FormState>? formKey;

  final phoneNumberDisable = true.obs;
  final canSave = false.obs;
}
