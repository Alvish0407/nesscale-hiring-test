import 'package:alvish_nesscale_assignment/core/models/item_model.dart';
import 'package:alvish_nesscale_assignment/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class AddItemController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  RxBool isAddingItem = false.obs;
  TextEditingController itemNameController = TextEditingController();
  TextEditingController itemCodeController = TextEditingController();
  TextEditingController itemRateController = TextEditingController();

  Future<void> addItem() async {
    if (formKey.currentState!.validate()) {
      try {
        isAddingItem.value = true;
        final String id = const Uuid().v4();
        final Item item = Item(
          itemId: id,
          isDeleted: false,
          name: itemNameController.text.trim(),
          code: itemCodeController.text.trim(),
          rate: double.parse(itemRateController.text.trim()),
        );
        Box<Item> itemsBox = await Hive.openBox<Item>("items");
        await itemsBox.put(id, item);
        Get.back();
        "Item has been added !".successSnackbar();
      } catch (e) {
        "Something went wrong! try again.".errorSnackbar();
        debugPrint(e.toString());
      } finally {
        isAddingItem.value = false;
      }
    }
  }
}
