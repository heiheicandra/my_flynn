import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flynn/utils/color_scheme.dart';
import 'package:my_flynn/utils/media_handler.dart';
import 'package:my_flynn/utils/num_extension.dart';
import 'package:my_flynn/utils/string_extension.dart';

class RequestImageDialog extends StatelessWidget {
  final Function(File image) onPick;
  const RequestImageDialog({
    super.key,
    required this.onPick,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      title: const Text('Please choose media to select'),
      content: SizedBox(
        height: 25.h(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () async {
                var result = await MediaHandler.gallery();
                if (result != null && result.fileName.isImage) {
                  Get.back();
                  onPick(result.file);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.primary600,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.image,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4.w(context),
                      ),
                      Text(
                        'From Gallery',
                        style: TextStyle(
                          fontSize: 18.sp(context),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h(context),
            ),
            InkWell(
              onTap: () async {
                var result = await MediaHandler.camera();
                if (result != null && result.fileName.isImage) {
                  Get.back();
                  onPick(result.file);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.primary600,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.camera,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 4.w(context),
                      ),
                      Text(
                        'From Camera',
                        style: TextStyle(
                          fontSize: 18.sp(context),
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2.h(context),
            ),
          ],
        ),
      ),
    );
  }
}
