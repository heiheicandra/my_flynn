import 'package:flutter/material.dart';
import 'package:my_flynn/utils/color_scheme.dart';
import 'package:my_flynn/utils/num_extension.dart';

class ProfileMenuItem extends StatelessWidget {
  final Widget icon;
  final String title;
  final VoidCallback? onTap;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade200,
            ),
          ),
        ),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp(context),
                  color: AppColor.nuGrey1200,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 24.sp(context),
              color: Colors.grey.shade400,
            ),
          ],
        ),
      ),
    );
  }
}
