import 'package:flutter/material.dart';
import 'package:my_flynn/utils/bool_extension.dart';
import 'package:my_flynn/utils/color_scheme.dart';
import 'package:my_flynn/utils/num_extension.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final double? height;
  final double? paddingVertical;
  final double? paddingHorizontal;
  final Color borderColor;
  final Color fillColor;
  final Color textColor;
  final bool isFillWidth;
  final bool isDisabled;
  final BorderRadiusGeometry? borderRadius;
  final double elevation;
  final TextStyle? textStyle;

  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.isFillWidth = false,
    this.isDisabled = false,
    this.borderColor = Colors.transparent,
    this.fillColor = AppColor.primary,
    this.textColor = Colors.white,
    this.height,
    this.paddingVertical,
    this.paddingHorizontal,
    this.borderRadius,
    this.elevation = 0,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFillWidth ? double.maxFinite : null,
      height: height,
      child: MaterialButton(
        elevation: (this).elevation,
        focusElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          side: isDisabled.either(
            trueV: () => BorderSide.none,
            falseV: () => BorderSide(
              color: borderColor,
            ),
          ),
        ),
        color: fillColor,
        disabledColor: const Color(0xFFE6E7E8),
        padding: EdgeInsets.symmetric(
          horizontal: (paddingHorizontal != null).either(
            trueV: () => paddingHorizontal?.w(context) ?? 0,
            falseV: () => 3.24.w(context),
          ),
          vertical: (paddingVertical != null).either(
            trueV: () => paddingVertical?.h(context) ?? 0,
            falseV: () => 2.h(context),
          ),
        ),
        onPressed: isDisabled ? null : onPressed,
        child: Text(
          title,
          style: textStyle ??
              TextStyle(
                fontSize: 14.sp(context),
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
        ),
      ),
    );
  }
}
