import 'package:flutter/material.dart';
import 'package:my_flynn/presentation/campaign/model/campaign_resp.dart';
import 'package:my_flynn/presentation/campaign/widget/campaign_empty.dart';
import 'package:my_flynn/presentation/campaign/widget/campaign_item.dart';
import 'package:my_flynn/presentation/campaign/widget/loading_column.dart';

class InProgressList extends StatelessWidget {
  final List<CampaignResp> data;
  final bool? isLoading;

  const InProgressList({
    super.key,
    required List<CampaignResp>? data,
    required this.isLoading,
  }) : data = data ?? const [];

  @override
  Widget build(BuildContext context) {
    if (isLoading == true) {
      return const LoadingColumn();
    }
    if (data.isEmpty) {
      return const CampaignEmpty();
    }
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: data.length,
      itemBuilder: (ctx, i) {
        return CampaignItem(
          data: data[i],
        );
      },
    );
  }
}
