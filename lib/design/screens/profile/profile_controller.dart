import 'package:alvish_nesscale_assignment/core/providers/auth_provider.dart';
import 'package:alvish_nesscale_assignment/core/services/gs_services.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final AuthProvider _authProvider = AuthProvider();

  final Map<String, dynamic>? userData = GSServices.getCurrentUserData();

  Future<void> logOut() async {
    await _authProvider.signOut();
  }
}
