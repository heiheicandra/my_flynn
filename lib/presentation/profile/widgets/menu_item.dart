import 'package:flutter/material.dart';
import 'package:my_flynn/utils/num_extension.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Icon(
            icon,
            size: 24.sp(context),
            color: Colors.grey.shade600,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16.sp(context),
                color: Colors.black,
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
    );
  }
}
