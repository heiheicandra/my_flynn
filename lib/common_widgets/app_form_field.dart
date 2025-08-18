import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_flynn/utils/bool_extension.dart';
import 'package:my_flynn/utils/num_extension.dart';

class AppFormField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final bool enabled;
  final bool readOnly;
  final bool mandatory;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final String? hintText;
  final Widget? suffix;
  final String? Function(String? value)? validator;
  final Function(String value)? onChanged;
  final Function()? onTap;

  const AppFormField({
    super.key,
    this.controller,
    String? label,
    bool? enabled,
    bool? readOnly,
    bool? mandatory,
    TextInputType? textInputType,
    TextInputAction? textInputAction,
    this.maxLength,
    this.hintText,
    this.suffix,
    this.validator,
    this.inputFormatters,
    this.onChanged,
    this.onTap,
  })  : label = label ?? '',
        enabled = enabled ?? true,
        readOnly = readOnly ?? false,
        mandatory = mandatory ?? false,
        textInputType = textInputType ?? TextInputType.text,
        textInputAction = textInputAction ?? TextInputAction.next;

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
          onTap: onTap,
          style: TextStyle(
            color: Colors.black,
            fontSize: 14.sp(context),
            fontWeight: FontWeight.w500,
          ),
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: enabled.either(
                trueV: () => Colors.grey.shade500,
                falseV: () => Colors.black,
              ),
              fontSize: 14.sp(context),
              fontWeight: FontWeight.w500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.grey.shade600,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.grey.shade600,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.grey.shade600,
              ),
            ),
            fillColor: enabled.either(
              trueV: () => Colors.white,
              falseV: () => Colors.grey.shade300,
            ),
            enabled: enabled,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.red,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(
                color: Colors.red,
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
                color: Colors.black,
              ),
            ),
            if (mandatory)
              TextSpan(
                text: ' *',
                style: TextStyle(
                  fontSize: 14.sp(context),
                  fontWeight: FontWeight.w500,
                  color: Colors.red,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
