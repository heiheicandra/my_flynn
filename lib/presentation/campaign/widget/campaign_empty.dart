import 'package:flutter/material.dart';
import 'package:my_flynn/utils/num_extension.dart';

class CampaignEmpty extends StatelessWidget {
  const CampaignEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h(context),
      width: 100.w(context),
      child: Center(
        child: Text(
          'There has been no campaign(s) for this category',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14.sp(context),
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
