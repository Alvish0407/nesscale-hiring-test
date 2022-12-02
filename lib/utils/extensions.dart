import 'dart:math' as math;

import 'package:alvish_nesscale_assignment/design/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);

  ThemeData get theme => Theme.of(this);

  TextTheme get tt => Theme.of(this).textTheme;

  ColorScheme get cs => Theme.of(this).colorScheme;

  double get width => MediaQuery.of(this).size.width;

  double get height => MediaQuery.of(this).size.height;

  double get topPadding => math.max(statusBarHeight + 10, 10);

  double get bottomPadding => math.max(bottomSafeHeight + 15, 15);

  double get statusBarHeight => MediaQuery.of(this).viewPadding.top;

  double get bottomSafeHeight => MediaQuery.of(this).viewPadding.bottom;

  double get devicePixelRatio => MediaQuery.of(this).devicePixelRatio;
}

extension PaddingExtension on Widget {
  Widget symmentric({double h = 0.0, double v = 0.0}) => Padding(
        padding: EdgeInsets.symmetric(horizontal: h, vertical: v),
        child: this,
      );

  Widget only(
          {double l = 0.0, double r = 0.0, double t = 0.0, double b = 0.0}) =>
      Padding(
        padding: EdgeInsets.fromLTRB(l, t, r, b),
        child: this,
      );

  Widget get defaultHorizontal => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: this,
      );

  Widget all(double value) => Padding(
        padding: EdgeInsets.all(value),
        child: this,
      );

  Widget comingSoon() => Center(
        child: GestureDetector(
          onTap: () => "Coming Soon".infoSnackbar(),
          child: this,
        ),
      );
}

extension LocalE7n on Locale {
  String encode() => languageCode;
}

extension IntE7n on int {
  bool get isLeapYear =>
      (this % 4 == 0) && ((this % 100 != 0) || (this % 400 == 0));
}

extension StringE7n on String {
  Locale getLocale() => Locale(this);

  DateTime get stringToDateTime {
    return DateTime.parse(this);
  }

  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  dynamic errorSnackbar() {
    Get
      ..closeAllSnackbars()
      ..rawSnackbar(
        message: this,
        backgroundColor: redColor,
      );
  }

  dynamic successSnackbar() {
    Get
      ..closeAllSnackbars()
      ..rawSnackbar(
        message: this,
        backgroundColor: greenColor,
      );
  }

  dynamic infoSnackbar() {
    Get
      ..closeAllSnackbars()
      ..rawSnackbar(
        message: this,
        backgroundColor: yellowColor,
      );
  }
}
