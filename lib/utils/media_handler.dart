import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_flynn/common_widgets/permission_settings_dialog.dart';
import 'package:my_flynn/core/permission_enum.dart';
import 'package:permission_handler/permission_handler.dart';

class ResultFile {
  late File file;
  String fileName = '';

  ResultFile.xfile(XFile result) {
    (this).file = File(result.path);
    (this).fileName = result.name;
  }
}

class MediaHandler {
  ///Use [ResultFile.file] to acccess the file
  static Future<ResultFile?> gallery() async {
    var valid = await _Permission().request(PlatformPermission.gallery);
    if (valid == true) {
      var file = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (file != null) {
        return ResultFile.xfile(file);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  ///Use [ResultFile.file] to acccess the file
  static Future<ResultFile?> camera() async {
    var valid = await _Permission().request(PlatformPermission.camera);
    if (valid == true) {
      var file = await ImagePicker().pickImage(source: ImageSource.camera);
      if (file != null) {
        return ResultFile.xfile(file);
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
}

class _Permission {
  Future<bool> request(PlatformPermission source) async {
    late Permission permission;
    late PermissionStatus status;
    bool result = true;

    switch (source) {
      case PlatformPermission.gallery:
        if (Platform.isIOS) {
          permission = Permission.storage;
        } else {
          final deviceInfoPlugin = DeviceInfoPlugin();
          final deviceInfo = await deviceInfoPlugin.androidInfo;
          if (deviceInfo.version.sdkInt > 32) {
            permission = Permission.photos;
          } else {
            permission = Permission.storage;
          }
        }
        break;
      case PlatformPermission.camera:
        permission = Permission.camera;
        break;
    }

    await permission.request().then((result) {
      status = result;
    });

    if (status == PermissionStatus.restricted) {
      (this).dialog(source);
      status = await permission.status;
      if (status != PermissionStatus.granted) {
        result = false;
      }
    }

    if (status == PermissionStatus.permanentlyDenied) {
      (this).dialog(source);
      status = await permission.status;
      if (status != PermissionStatus.granted) {
        result = false;
      }
    }

    if (status == PermissionStatus.denied) {
      if (Platform.isIOS) {
        (this).dialog(source);
      } else {
        result = false;
      }

      if (status != PermissionStatus.granted) {
        result = false;
      }
    }

    return result;
  }

  void dialog(PlatformPermission source) {
    Get.dialog(
      PermissionSettingsDialog(permission: source),
      barrierDismissible: false,
    );
  }
}
