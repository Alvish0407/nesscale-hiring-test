import 'package:alvish_nesscale_assignment/core/models/customer_model.dart';
import 'package:alvish_nesscale_assignment/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CustomerController extends GetxController {
  late Box<Customer> customerBox;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onClose() {
    customerBox.close();
    super.onClose();
  }

  Future<void> init() async {
    isLoading.value = true;
    customerBox = await Hive.openBox<Customer>("customers");
    isLoading.value = false;
  }

  Future<void> removeCustomer(Customer? customer) async {
    if (customer == null) return;
    await customerBox.put(
      customer.customerId,
      customer.copyWith(isDeleted: true),
    );
    "Customer has been deleted !".successSnackbar();
  }
}
