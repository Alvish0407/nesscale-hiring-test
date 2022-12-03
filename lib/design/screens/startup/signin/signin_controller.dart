import 'dart:async';

import 'package:alvish_nesscale_assignment/core/providers/auth_provider.dart';
import 'package:alvish_nesscale_assignment/core/routes/app_pages.dart';
import 'package:alvish_nesscale_assignment/core/services/base_services.dart';
import 'package:alvish_nesscale_assignment/core/services/gs_services.dart';
import 'package:alvish_nesscale_assignment/utils/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignInController extends GetxController {
  RxBool isOTPSent = false.obs;
  RxBool isSendingOtp = false.obs;
  FocusNode mobileFocusNode = FocusNode();
  final AuthProvider _authProvider = AuthProvider();
  GlobalKey<FormState> mobileNumberFormKey = GlobalKey<FormState>();
  TextEditingController mobileController = TextEditingController();

  String? verificationId;

  Future<void> signInWithPhoneNumber() async {
    if (mobileNumberFormKey.currentState!.validate()) {
      try {
        isSendingOtp.value = true;

        await _authProvider.signInWithPhoneNumber(
          phoneNumber: '+91${mobileController.text}',
          onCodeSent: (String vId, int? forceResendingToken) {
            verificationId = vId;
            isOTPSent.value = true;
            debugPrint("Code Has Been Sent: $verificationId");
            'OTP has been sent !'.successSnackbar();
          },
        );
      } catch (e) {
        debugPrint(e.toString());
      } finally {
        isSendingOtp.value = false;
      }
    }
  }

  FocusNode otpFocusNode = FocusNode();
  TextEditingController otpController = TextEditingController();
  StreamController<ErrorAnimationType> otpErrorController =
      StreamController<ErrorAnimationType>();

  Future<void> verifyOTP(String otp) async {
    if (verificationId != null) {
      try {
        UserCredential userCredential = await _authProvider.verifyOTP(
          verificationId: verificationId!,
          otp: otpController.text,
        );
        debugPrint('userCredential: $userCredential');
        "OTP Verified Successfully !".successSnackbar();
        _navigateToHomeAndSaveUserType(userCredential.user?.phoneNumber);
      } on AppException catch (e) {
        if (e.prefix == 'invalid-verification-code') {
          "Invalid OTP !".errorSnackbar();
          otpErrorController.add(ErrorAnimationType.shake);
        } else {
          "Internal error occured !".errorSnackbar();
        }
        debugPrint(e.toString());
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }

  void _navigateToHomeAndSaveUserType(String? phoneNumber) async {
    if (phoneNumber != null) {
      await GSServices.setCurrentUserData({'contactNumber': phoneNumber});
      Get.offAllNamed(Routes.HOME);
    } else {
      debugPrint("Phone Number got Null !!!");
    }
  }
}
