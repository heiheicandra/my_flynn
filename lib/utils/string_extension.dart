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
    return lower.endsWith("png") ||
        lower.endsWith("jpg") ||
        lower.endsWith("jpeg");
  }
}
