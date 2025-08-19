//coverage:ignore-file
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:my_flynn/presentation/profile/view/profile_page.dart";
import "package:my_flynn/utils/color_scheme.dart";
import "package:my_flynn/utils/num_extension.dart";

class NotFoundPage extends StatelessWidget {
  static const String routeName = "/notFound-page";

  const NotFoundPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Not Found'),
        backgroundColor: AppColor.primary600,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 80,
              color: Colors.grey,
            ),
            const SizedBox(height: 20),
            Text(
              '404',
              style: TextStyle(
                fontSize: 48.sp(context),
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'Page Not Found',
              style: TextStyle(
                fontSize: 24.sp(context),
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(ProfilePage.routeName);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColor.primary600,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: const Text(
                'Go to Dashboard',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
