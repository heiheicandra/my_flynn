import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flynn/utils/bool_extension.dart';
import 'package:my_flynn/utils/color_scheme.dart';
import 'package:my_flynn/utils/num_extension.dart';

class AppFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool enabled;
  final bool readOnly;
  final bool mandatory;
  final bool obscureText;
  final FocusNode? focusNode;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final String? hintText;
  final Widget? suffix;
  final String? Function(String? value)? validator;
  final Function(String value)? onFieldSubmitted;
  final Function(String value)? onChanged;
  final Function()? onTap;

  const AppFormField({
    super.key,
    this.controller,
    String? label,
    bool? enabled,
    bool? readOnly,
    bool? mandatory,
    bool? obscureText,
    TextInputType? textInputType,
    this.onFieldSubmitted,
    this.textInputAction,
    this.focusNode,
    this.maxLength,
    this.hintText,
    this.suffix,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
  })  : label = label ?? '',
        enabled = enabled ?? true,
        obscureText = obscureText ?? false,
        readOnly = readOnly ?? false,
        mandatory = mandatory ?? false,
        textInputType = textInputType ?? TextInputType.text;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label.isNotEmpty)
          FormLabel(
            label: label,
            mandatory: mandatory,
          ),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          enabled: enabled,
          keyboardType: textInputType,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          maxLength: maxLength,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText,
          onTap: onTap,
          style: TextStyle(
            color: AppColor.nuGrey1200,
            fontSize: 14.sp(context),
            fontWeight: FontWeight.w500,
          ),
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: enabled.either(
                trueV: () => AppColor.nuGrey500,
                falseV: () => AppColor.nuGrey1200,
              ),
              fontSize: 14.sp(context),
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColor.nuGrey200,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColor.nuGrey200,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColor.nuGrey200,
              ),
            ),
            fillColor: enabled.either(
              trueV: () => Colors.white,
              falseV: () => AppColor.nuGrey100,
            ),
            enabled: enabled,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColor.secondary150,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColor.nuGrey1200,
                width: 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: AppColor.secondary150,
                width: 1.5,
              ),
            ),
            suffixIcon: suffix,
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}

class FormLabel extends StatelessWidget {
  final String label;
  final bool mandatory;
  const FormLabel({
    super.key,
    required this.label,
    bool? mandatory,
  }) : mandatory = mandatory ?? false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          children: [
            TextSpan(
              text: label,
              style: TextStyle(
                fontSize: 14.sp(context),
                fontWeight: FontWeight.w500,
                color: AppColor.nuGrey1200,
              ),
            ),
            if (mandatory)
              TextSpan(
                text: ' *',
                style: TextStyle(
                  fontSize: 14.sp(context),
                  fontWeight: FontWeight.w500,
                  color: AppColor.secondary150,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
