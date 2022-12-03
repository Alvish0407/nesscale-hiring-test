import 'package:alvish_nesscale_assignment/design/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';

double bottomButtonHeight = 160;

const double flatButtonHeight = 55;

double textFieldHeight = 50;

const String iconPath = 'assets/icons';
const String imagePath = 'assets/images';

const ScrollPhysics defaultPhysics = BouncingScrollPhysics(
  parent: AlwaysScrollableScrollPhysics(),
);

const ScrollPhysics neverScrollablePhysics = NeverScrollableScrollPhysics();

const double defaultButtonPressedOpacity = 0.6;

const TextOverflow defaultOverflow = TextOverflow.ellipsis;

const double horizontalPadding = 15;

Widget defaultLoader({Color? color}) =>
    CupertinoActivityIndicator(color: color ?? lPrimaryColor);
