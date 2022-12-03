import 'package:alvish_nesscale_assignment/core/routes/app_pages.dart';
import 'package:alvish_nesscale_assignment/utils/enum.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<Segments> selectedSegment = Segments.customer.obs;

  Future<void> add() async {
    if (selectedSegment.value == Segments.customer) {
      await Get.toNamed(Routes.ADD_CUSTOMER);
    } else if (selectedSegment.value == Segments.item) {
      await Get.toNamed(Routes.ADD_ITEM);
    } else if (selectedSegment.value == Segments.invoice) {
      await Get.toNamed(Routes.ADD_INVOICE);
    } else {
      await Get.toNamed(Routes.UNKNOW_404);
    }
  }
}
