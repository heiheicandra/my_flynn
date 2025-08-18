import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedListBuilder extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final bool shrinkWrap;
  final ScrollPhysics? physics;
  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;
  const AnimatedListBuilder({
    super.key,
    this.padding = EdgeInsets.zero,
    this.shrinkWrap = true,
    this.physics,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: ListView.builder(
        padding: padding,
        itemCount: itemCount,
        shrinkWrap: shrinkWrap,
        physics: physics,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              // horizontalOffset: 50.0,
              verticalOffset: 20.0,
              child: FadeInAnimation(
                child: itemBuilder(context, index),
              ),
            ),
          );
        },
      ),
    );
  }
}
