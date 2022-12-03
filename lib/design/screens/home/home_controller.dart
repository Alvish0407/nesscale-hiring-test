import 'package:alvish_nesscale_assignment/core/providers/auth_provider.dart';
import 'package:alvish_nesscale_assignment/core/routes/app_pages.dart';
import 'package:alvish_nesscale_assignment/utils/enum.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<Segments> selectedSegment = Segments.customer.obs;

  final AuthProvider _authProvider = AuthProvider();

  Future<void> add() async {
    if (selectedSegment.value == Segments.customer) {
      await Get.toNamed(Routes.ADD_CUSTOMER);
    } else if (selectedSegment.value == Segments.item) {
      await Get.toNamed(Routes.ADD_ITEM);
    }
  }

  Future<void> logOut() async {
    await _authProvider.signOut();
  }
}
