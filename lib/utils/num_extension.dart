import 'package:flutter/material.dart';

extension NumExtension on num? {
  double sp(BuildContext context) {
    final number = this ?? 0;
    final width = MediaQuery.of(context).size.width;
    return number * (width / 3) / 100;
  }

  double w(BuildContext context) {
    final number = this ?? 0;
    final currentWidth = MediaQuery.of(context).size.width;
    return (number / 100) * currentWidth;
  }

  double h(BuildContext context) {
    final number = this ?? 0;
    final currentHeight = MediaQuery.of(context).size.height;
    return (number / 100) * currentHeight;
  }
}
