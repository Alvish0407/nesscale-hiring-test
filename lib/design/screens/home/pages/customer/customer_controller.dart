import 'package:alvish_nesscale_assignment/core/models/customer_model.dart';
import 'package:alvish_nesscale_assignment/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CustomerController extends GetxController {
  Box<Customer> customerBox = Hive.box<Customer>("customers");

  Future<void> removeCustomer(Customer? customer) async {
    if (customer == null) return;
    await customerBox.put(
      customer.customerId,
      customer.copyWith(isDeleted: true),
    );
    "Customer has been deleted !".successSnackbar();
  }
}
