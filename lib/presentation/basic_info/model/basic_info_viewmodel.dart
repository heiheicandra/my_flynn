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

  final phoneNumberDisable = false.obs;
  final canSave = false.obs;
}
