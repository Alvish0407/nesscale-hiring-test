import 'package:alvish_nesscale_assignment/core/models/customer_model.dart';
import 'package:alvish_nesscale_assignment/core/models/invoice_model.dart';
import 'package:alvish_nesscale_assignment/core/models/item_model.dart';
import 'package:alvish_nesscale_assignment/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class AddInvoiceController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isAddingInvoice = false.obs;
  Box<Item> itemBox = Hive.box<Item>("items");
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Box<Invoice> invoiceBox = Hive.box<Invoice>("invoices");
  Box<Customer> customerBox = Hive.box<Customer>("customers");

  List<Item> items = [];
  RxDouble total = 0.0.obs;
  String? selectedCustomerId;
  List<Customer> customers = [];
  List<OrderedItem> orderItems = <OrderedItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    customers =
        customerBox.values.where((customer) => !customer.isDeleted).toList();
    items = itemBox.values.where((item) => !item.isDeleted).toList();
    selectedCustomerId = customerBox.values.first.customerId;
  }

  void incrementQuantity(Item item) async {
    final int index =
        orderItems.indexWhere((orderItem) => orderItem.itemId == item.itemId);
    if (index == -1) {
      orderItems.add(OrderedItem(quantity: 1, itemId: item.itemId));
    } else {
      orderItems[index].quantity++;
    }
    total.value += item.rate;
    update();
  }

  void decrementQuantity(Item item) async {
    final int index =
        orderItems.indexWhere((orderItem) => orderItem.itemId == item.itemId);
    if (index != -1 && orderItems[index].quantity > 0) {
      orderItems[index].quantity--;
      total.value -= item.rate;
    }
    update();
  }

  int getQuantity(Item item) {
    final int index =
        orderItems.indexWhere((orderItem) => orderItem.itemId == item.itemId);
    if (index == -1) {
      return 0;
    } else {
      return orderItems[index].quantity;
    }
  }

  Future<void> createInvoice() async {
    if (selectedCustomerId == null) {
      return "Select the customer !".infoSnackbar();
    }
    final List<OrderedItem> finalOrderedItems =
        orderItems.where((orderedItem) => orderedItem.quantity > 0).toList();
    if (finalOrderedItems.isEmpty) return "Add the products !".infoSnackbar();

    try {
      isAddingInvoice.value = true;
      final String invoiceId = const Uuid().v4();

      final Invoice invoice = Invoice(
        total: total.value,
        dateTime: DateTime.now(),
        invoiceId: invoiceId,
        customerId: selectedCustomerId!,
        orderedItem: finalOrderedItems,
      );
      await invoiceBox.put(invoiceId, invoice);

      Get.back();
      "Invoice has been generated !".successSnackbar();
    } catch (e) {
      "Something went wrong! try again.".errorSnackbar();
      debugPrint(e.toString());
    } finally {
      isAddingInvoice.value = false;
    }
  }
}
