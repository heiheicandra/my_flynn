import 'package:flutter/material.dart';
import 'package:my_flynn/utils/bool_extension.dart';

class AnimatedSwitcherSize extends StatelessWidget {
  static final _key = UniqueKey();
  final Widget? child;
  final Duration fadeDuration;
  final Duration sizeDuration;
  final Curve fadeInCurve;
  final Curve fadeOutCurve;
  final Curve sizeCurve;
  final Alignment alignment;
  final bool show;
  const AnimatedSwitcherSize({
    super.key,
    this.child,
    this.fadeDuration = const Duration(milliseconds: 500),
    this.sizeDuration = const Duration(milliseconds: 500),
    this.fadeInCurve = Curves.easeInOut,
    this.fadeOutCurve = Curves.easeInOut,
    this.sizeCurve = Curves.easeInOut,
    this.alignment = Alignment.center,
  }) : show = true;

  const AnimatedSwitcherSize.showHide({
    super.key,
    this.child,
    required this.show,
    this.fadeDuration = const Duration(milliseconds: 500),
    this.sizeDuration = const Duration(milliseconds: 500),
    this.fadeInCurve = Curves.easeInOut,
    this.fadeOutCurve = Curves.easeInOut,
    this.sizeCurve = Curves.easeInOut,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    var animatedSize = AnimatedSize(
      duration: sizeDuration,
      curve: sizeCurve,
      child: AnimatedSwitcher(
        duration: fadeDuration,
        switchInCurve: fadeInCurve,
        switchOutCurve: fadeOutCurve,
        layoutBuilder: _layoutBuilder,
        child: show.either(
          trueV: () => child,
          falseV: () => SizedBox(
            key: AnimatedSwitcherSize._key,
            width: double.infinity,
            height: 0,
          ),
        ),
      ),
    );
    return ClipRect(child: animatedSize);
  }

  Widget _layoutBuilder(Widget? currentChild, List<Widget> previousChildren) {
    List<Widget> children = previousChildren;
    if (currentChild != null) {
      if (previousChildren.isEmpty) {
        children = [currentChild];
      } else {
        children = [
          Positioned(
            left: 0.0,
            right: 0.0,
            child: Container(child: previousChildren[0]),
          ),
          Container(child: currentChild),
        ];
      }
    }
    return Stack(
      clipBehavior: Clip.none,
      alignment: alignment,
      children: children,
    );
  }
}
