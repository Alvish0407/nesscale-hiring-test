import 'package:alvish_nesscale_assignment/core/models/item_model.dart';
import 'package:alvish_nesscale_assignment/utils/extensions.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ItemController extends GetxController {
  late Box<Item> itemBox;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onClose() {
    itemBox.close();
    super.onClose();
  }

  Future<void> init() async {
    isLoading.value = true;
    itemBox = await Hive.openBox<Item>("items");
    isLoading.value = false;
  }

  Future<void> removeItem(Item? item) async {
    if (item == null) return;
    await itemBox.put(
      item.itemId,
      item.copyWith(isDeleted: true),
    );
    "Item has been deleted !".successSnackbar();
  }
}
