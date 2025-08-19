import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flynn/common_widgets/shared_button.dart';
import 'package:my_flynn/core/permission_enum.dart';
import 'package:my_flynn/utils/color_scheme.dart';
import 'package:my_flynn/utils/num_extension.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionSettingsDialog extends StatelessWidget {
  final PlatformPermission permission;
  const PermissionSettingsDialog({super.key, required this.permission});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 1.h(context)),
            Icon(
              Icons.phonelink_lock_outlined,
              color: AppColor.nuGrey1200,
              size: 10.h(context),
            ),
            SizedBox(height: 1.h(context)),
            Text(
              '${permission.label} Permission Denied',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.sp(context),
                fontWeight: FontWeight.bold,
                color: AppColor.nuGrey1200,
              ),
            ),
            SizedBox(height: 1.h(context)),
            Text(
              'You can enable pemission at your settings\nto access this feature.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp(context),
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 2.h(context)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppButton(
                  paddingVertical: 1,
                  title: 'Cancel',
                  fillColor: Colors.white,
                  textColor: AppColor.primary600,
                  borderColor: AppColor.primary600,
                  borderRadius: BorderRadius.circular(8),
                  textStyle: TextStyle(
                    fontSize: 15.sp(context),
                    color: AppColor.nuGrey1200,
                  ),
                  onPressed: () => Get.back(),
                ),
                SizedBox(width: 3.w(context)),
                AppButton(
                  paddingVertical: 1,
                  title: 'Open Settings',
                  borderRadius: BorderRadius.circular(8),
                  textStyle: TextStyle(
                    fontSize: 15.sp(context),
                    color: Colors.white,
                  ),
                  onPressed: () => openAppSettings(),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
