import 'package:alvish_nesscale_assignment/core/models/item_model.dart';
import 'package:alvish_nesscale_assignment/design/components/c_core_button.dart';
import 'package:alvish_nesscale_assignment/design/components/key_value.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/item/item_controller.dart';
import 'package:alvish_nesscale_assignment/design/utils/app_colors.dart';
import 'package:alvish_nesscale_assignment/design/utils/design_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ItemView extends StatelessWidget {
  const ItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemController>(
      init: ItemController(),
      builder: (controller) {
        return Obx(
          () => controller.isLoading.value
              ? defaultLoader()
              : ValueListenableBuilder(
                  valueListenable: controller.itemBox.listenable(),
                  builder: (context, Box<Item> box, _) {
                    return ListView.builder(
                      itemCount: box.length,
                      padding: EdgeInsets.zero,
                      physics: defaultPhysics,
                      itemBuilder: (context, index) {
                        final Item? item = box.getAt(index);
                        return (item?.isDeleted ?? true)
                            ? const SizedBox.shrink()
                            : Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                        bottom: 10,
                                        left: horizontalPadding,
                                        right: horizontalPadding,
                                      ),
                                      padding: const EdgeInsets.only(top: 15),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: pureBlackColor
                                                .withOpacity(.33)),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Column(
                                        children: [
                                          KeyValue('Item Name', item?.name),
                                          KeyValue('Item Code', item?.code),
                                          KeyValue(
                                              'Item Rate', "${item?.rate} Rs."),
                                          const SizedBox(height: 15),
                                        ],
                                      ),
                                    ),
                                  ),
                                  CCoreButton(
                                    child: const Icon(
                                      CupertinoIcons.delete,
                                      color: redColor,
                                    ),
                                    onPressed: () =>
                                        controller.removeItem(item),
                                  ),
                                  const SizedBox(width: 15),
                                ],
                              );
                      },
                    );
                  },
                ),
        );
      },
    );
  }
}
