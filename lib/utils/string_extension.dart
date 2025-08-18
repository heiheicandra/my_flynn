import 'package:my_flynn/core/permission_enum.dart';

extension StringExtension on String? {
  String get dashIfEmpty {
    final str = this ?? '';
    if (str.isEmpty) {
      return '-';
    }
    return str;
  }

  bool get isImage {
    final lower = (this ?? "").toLowerCase();
    return PlatformPermission.camera.allowedExtensions.any((e) => lower == e) ||
        PlatformPermission.gallery.allowedExtensions.any((e) => lower == e);
  }

  bool get isDocument {
    final lower = (this ?? "").toLowerCase();
    return PlatformPermission.document.allowedExtensions
            .any((e) => lower == e) ||
        PlatformPermission.gallery.allowedExtensions.any((e) => lower == e);
  }
}
