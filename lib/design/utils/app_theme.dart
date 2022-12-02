import 'package:alvish_nesscale_assignment/design/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static final lightTheme = ThemeData.light().copyWith(
    errorColor: redColor,
    backgroundColor: lbgColor,
    primaryColor: lPrimaryColor,
    primaryColorLight: lPrimaryColor,
    splashColor: Colors.transparent,
    scaffoldBackgroundColor: lbgColor,
    hintColor: lPrimaryColor.withOpacity(.4),
    iconTheme: const IconThemeData(size: 24),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: lbgColor,
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: lPrimaryColor),
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      barBackgroundColor: lbgColor,
      primaryColor: lPrimaryColor,
      scaffoldBackgroundColor: lbgColor,
      textTheme: CupertinoTextThemeData(
        textStyle: TextStyle(
          fontSize: 14,
          color: lPrimaryTextColor,
          fontFamily: getPoppinsFontFamily,
        ),
        primaryColor: lPrimaryColor,
      ),
    ),
  );
}
