import 'package:alvish_nesscale_assignment/design/components/c_core_button.dart';
import 'package:alvish_nesscale_assignment/design/components/c_header.dart';
import 'package:alvish_nesscale_assignment/design/screens/profile/profile_controller.dart';
import 'package:alvish_nesscale_assignment/design/utils/design_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ProfileView extends GetWidget<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CHeader(
        text: 'Profile',
        actions: [
          CCoreButton(
            onPressed: controller.logOut,
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              'Log Out',
              style: TextThemeX.text16.copyWith(color: pureWhiteColor),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Icon(
              CupertinoIcons.person_alt_circle,
              size: 170,
            ),
            const SizedBox(height: 30),
            Text(
              controller.userData?["contactNumber"].toString() ?? '-',
              style: TextThemeX.text22,
            ),
          ],
        ),
      ),
    );
  }
}
