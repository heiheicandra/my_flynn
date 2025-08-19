import 'package:flutter/material.dart';
import 'package:my_flynn/utils/num_extension.dart';

class ProfileStatItem extends StatelessWidget {
  final String number;
  final String label;
  final Color color;

  const ProfileStatItem({
    super.key,
    required this.number,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            fontSize: 18.sp(context),
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp(context),
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
