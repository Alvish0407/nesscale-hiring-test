import 'dart:async';

import 'package:alvish_nesscale_assignment/core/providers/auth_provider.dart';
import 'package:alvish_nesscale_assignment/core/routes/app_pages.dart';
import 'package:alvish_nesscale_assignment/core/services/gs_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final AuthProvider _authProvider = AuthProvider();

  @override
  void onReady() {
    super.onReady();
    checkUserSignedIn();
  }

  Future<void> checkUserSignedIn() async {
    // ?Authenticated through local(GS) User
    // TODO: Check if user is authenticated through firebase user(previously it returns null on web)
    User? currentFirebaseUser = _authProvider.getCurrentFirebaseUser();
    Map? currentLocalUser = GSServices.getCurrentUserData();

    debugPrint("currentFirebaseUser: $currentFirebaseUser");
    debugPrint("CurrentLocalUser: $currentLocalUser");

    Timer(
      const Duration(seconds: 2),
      () =>
          Get.offNamed(currentLocalUser == null ? Routes.SIGNIN : Routes.HOME),
    );
  }
}
