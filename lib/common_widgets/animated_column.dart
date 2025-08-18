import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AnimatedColumn extends StatelessWidget {
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final Duration duration;
  const AnimatedColumn({
    super.key,
    required this.children,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.duration = const Duration(milliseconds: 375),
  });

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: Column(
        crossAxisAlignment: (this).crossAxisAlignment,
        mainAxisAlignment: (this).mainAxisAlignment,
        mainAxisSize: (this).mainAxisSize,
        children: AnimationConfiguration.toStaggeredList(
          duration: duration,
          childAnimationBuilder: (widget) => SlideAnimation(
            verticalOffset: 20.0,
            child: FadeInAnimation(
              child: widget,
            ),
          ),
          children: [
            Column(
              crossAxisAlignment: (this).crossAxisAlignment,
              mainAxisAlignment: (this).mainAxisAlignment,
              mainAxisSize: (this).mainAxisSize,
              children: (this).children,
            ),
          ],
        ),
      ),
    );
  }
}
