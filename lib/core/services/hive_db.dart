import 'dart:io';

import 'package:alvish_nesscale_assignment/core/models/customer_model.dart';
import 'package:alvish_nesscale_assignment/core/models/invoice_model.dart';
import 'package:alvish_nesscale_assignment/core/models/item_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class HiveDB {
  Future<void> initHive() async {
    final Directory appDocumentDir =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDir.path);
    Hive.registerAdapter(CustomerAdapter());
    Hive.registerAdapter(ItemAdapter());
    Hive.registerAdapter(InvoiceAdapter());
    Hive.registerAdapter(OrderedItemAdapter());
  }
}
