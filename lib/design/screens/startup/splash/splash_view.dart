import 'package:alvish_nesscale_assignment/design/screens/startup/splash/splash_controller.dart';
import 'package:alvish_nesscale_assignment/design/utils/app_colors.dart';
import 'package:alvish_nesscale_assignment/design/utils/app_text_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SplashView extends GetWidget<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Alvish',
              style: TextThemeX.text64.copyWith(
                color: lPrimaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              'Nesscale Assignment',
              style: TextThemeX.text26.copyWith(
                color: lPrimaryColor,
                height: 0.4,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
