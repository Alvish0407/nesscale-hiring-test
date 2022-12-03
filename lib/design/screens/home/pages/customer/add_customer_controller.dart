import 'package:alvish_nesscale_assignment/core/models/customer_model.dart';
import 'package:alvish_nesscale_assignment/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

class AddCustomerController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isAddingCustomer = false.obs;
  TextEditingController customerNameController = TextEditingController();
  TextEditingController customerEmailController = TextEditingController();
  TextEditingController customerMobileController = TextEditingController();

  Future<void> addCustomer() async {
    if (formKey.currentState!.validate()) {
      try {
        isAddingCustomer.value = true;
        final String id = const Uuid().v4();
        final Customer customer = Customer(
          customerId: id,
          isDeleted: false,
          name: customerNameController.text.trim(),
          email: customerEmailController.text.trim(),
          mobileNo: customerMobileController.text.trim(),
        );
        Box<Customer> customersBox = await Hive.openBox<Customer>("customers");
        await customersBox.put(id, customer);
        Get.back();
        "Customer has been added !".successSnackbar();
      } catch (e) {
        "Something went wrong! try again.".errorSnackbar();
        debugPrint(e.toString());
      } finally {
        isAddingCustomer.value = false;
      }
    }
  }
}
