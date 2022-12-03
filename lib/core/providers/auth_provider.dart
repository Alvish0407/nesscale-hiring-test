import 'package:alvish_nesscale_assignment/core/routes/app_pages.dart';
import 'package:alvish_nesscale_assignment/core/services/base_services.dart';
import 'package:alvish_nesscale_assignment/core/services/gs_services.dart';
import 'package:alvish_nesscale_assignment/utils/extensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class AuthProvider with BaseService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  AuthProvider._internal();
  factory AuthProvider() => _authProvider;
  static final AuthProvider _authProvider = AuthProvider._internal();

  Future<void> signInWithPhoneNumber({
    required String phoneNumber,
    required Function(String vId, int? forceResendingToken) onCodeSent,
  }) async {
    return await tryOrCatch<void>(() async {
      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        codeAutoRetrievalTimeout: (String verificationId) {
          debugPrint("Code AutoRetrieval Timeout");
        },
        codeSent: onCodeSent,
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {
          debugPrint(
              "Verification Completed: ${phoneAuthCredential.toString()}");
        },
        verificationFailed: (FirebaseAuthException error) {
          if (error.code == 'too-many-requests') {
            error.message?.errorSnackbar();
          }
          debugPrint(error.toString());
        },
      );
    });
  }

  Future<UserCredential> verifyOTP({
    required String verificationId,
    required String otp,
  }) async {
    return await tryOrCatch<UserCredential>(() async {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(phoneAuthCredential);

      return userCredential;
    });
  }

  User? getCurrentFirebaseUser() {
    return _firebaseAuth.currentUser;
  }

  Future<bool> signOut() async {
    return await tryOrCatch<bool>(() async {
      await _firebaseAuth.signOut();
      await GSServices.clearLocalStorage();
      Get.offAllNamed(Routes.SIGNIN);
      return true;
    });
  }
}
