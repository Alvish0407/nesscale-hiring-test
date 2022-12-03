import 'package:alvish_nesscale_assignment/design/components/c_flat_button.dart';
import 'package:alvish_nesscale_assignment/design/components/c_header.dart';
import 'package:alvish_nesscale_assignment/design/components/c_text_field.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/item/add_item_controller.dart';
import 'package:alvish_nesscale_assignment/design/utils/design_utils.dart';
import 'package:alvish_nesscale_assignment/design/utils/validators.dart';
import 'package:alvish_nesscale_assignment/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddItemView extends GetWidget<AddItemController> {
  const AddItemView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CHeader(text: 'Add Item'),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            CTextField(
              labelText: 'Item Name',
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              controller: controller.itemNameController,
              validator: AuthValidator.emptyNullValidator,
            ).only(b: 10),
            CTextField(
              labelText: 'Item Code',
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              controller: controller.itemCodeController,
              validator: AuthValidator.emptyNullValidator,
            ).only(b: 10),
            CTextField(
              labelText: 'Item Rate',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              controller: controller.itemRateController,
              suffixIcon:
                  const Icon(Icons.currency_rupee, color: pureBlackColor),
              validator: AuthValidator.emptyNullValidator,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ).only(b: 10),
            const Spacer(),
            Obx(() {
              return CFlatButton(
                text: 'CREATE ITEM',
                onPressed: controller.addItem,
                isLoading: controller.isAddingItem.value,
              ).symmentric(h: 15);
            }),
          ],
        ).only(
            b: context.bottomSafeHeight,
            l: horizontalPadding,
            r: horizontalPadding,
            t: 20),
      ),
    );
  }
}
