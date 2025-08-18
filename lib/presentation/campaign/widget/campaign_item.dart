import 'package:flutter/material.dart';
import 'package:my_flynn/common_widgets/network_image_loader.dart';
import 'package:my_flynn/presentation/campaign/model/campaign_resp.dart';
import 'package:my_flynn/presentation/campaign/widget/campaign_tag.dart';
import 'package:my_flynn/utils/num_extension.dart';

class CampaignItem extends StatelessWidget {
  final CampaignResp data;

  const CampaignItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: .05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NetworkImageLoader(
            imageUrl: data.imageUrl,
            width: 30.w(context),
            height: 30.w(context),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.sp(context),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  data.subTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.sp(context),
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 4,
                  children: data.tags
                      .map(
                        (e) => CampaignTag(label: e),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
