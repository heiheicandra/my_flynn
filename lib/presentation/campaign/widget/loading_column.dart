import 'package:flutter/material.dart';
import 'package:my_flynn/common_widgets/animated_column.dart';
import 'package:my_flynn/utils/bool_extension.dart';
import 'package:my_flynn/utils/num_extension.dart';
import 'package:skeletonizer/skeletonizer.dart';

class LoadingColumn extends StatelessWidget {
  const LoadingColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: AnimatedColumn(
        children: List.generate(5, (i) {
          return Skeletonizer(
            enabled: true,
            child: Skeleton.shade(
              child: Container(
                margin: EdgeInsets.only(
                  top: (i == 0).either(
                    trueV: () => 0,
                    falseV: () => 8,
                  ),
                  bottom: (i == 4).either(
                    trueV: () => 0,
                    falseV: () => 8,
                  ),
                ),
                width: 100.w(context),
                height: 18.h(context),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
