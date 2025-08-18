class CampaignResp {
  final String imageUrl;
  final String title;
  final String subTitle;
  final List<String> tags;
  CampaignResp({
    String? imageUrl,
    String? title,
    String? subTitle,
    List<String>? tags,
  })  : imageUrl = imageUrl ?? "",
        title = title ?? "",
        subTitle = subTitle ?? "",
        tags = tags ?? [];
}
