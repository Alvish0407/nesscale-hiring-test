import 'package:alvish_nesscale_assignment/core/models/customer_model.dart';
import 'package:alvish_nesscale_assignment/core/models/invoice_model.dart';
import 'package:alvish_nesscale_assignment/core/models/item_model.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class InvoiceController extends GetxController {
  Box<Invoice> invoiceBox = Hive.box<Invoice>("invoices");
  Box<Customer> customerBox = Hive.box<Customer>("customers");
  Box<Item> itemBox = Hive.box<Item>("items");
}
