import 'package:flutter/material.dart';
import 'package:my_flynn/utils/color_scheme.dart';
import 'package:my_flynn/utils/num_extension.dart';

class CampaignTag extends StatelessWidget {
  final String label;
  const CampaignTag({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: AppColor.primary50,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: AppColor.primary600,
          fontSize: 8.sp(context),
        ),
      ),
    );
  }
}
