enum PlatformPermission {
  camera("Camera", ["png", "jpg", "jpeg"]),
  gallery("Gallery", ["png", "jpg", "jpeg"]),
  document("Storage", ['pdf', 'doc', 'docx', 'xls', 'xlsx', 'ppt', 'pptx']);

  final String label;
  final List<String> allowedExtensions;
  const PlatformPermission(this.label, this.allowedExtensions);
}
