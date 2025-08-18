import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:my_flynn/utils/color_scheme.dart";
import "package:my_flynn/utils/num_extension.dart";
import 'package:my_flynn/presentation/splash_page/controller/splash_page_controller.dart';

class SplashPage extends GetView<SplashPageControllerInterface> {
  static const String routeName = "/splash-page";

  const SplashPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: Text(
          'MY FLYN',
          style: TextStyle(
            fontSize: 32.sp(context),
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 2.0,
          ),
        ),
      ),
    );
  }
}
