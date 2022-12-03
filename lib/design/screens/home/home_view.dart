import 'package:alvish_nesscale_assignment/design/screens/home/home_controller.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/customer/customer_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/invoice/invoice_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/item/item_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/unknown_404_view.dart';
import 'package:alvish_nesscale_assignment/design/utils/design_utils.dart';
import 'package:alvish_nesscale_assignment/utils/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: Row(
          children: [
            const Icon(CupertinoIcons.person_alt_circle, color: lPrimaryColor),
            const SizedBox(width: 5),
            Text(
              'Alvish',
              style: TextThemeX.text16.copyWith(color: lPrimaryColor),
            ),
          ],
        ),
        trailing: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: controller.add,
              child: const Text('Add'),
            ),
            CupertinoButton(
              padding: const EdgeInsets.only(left: 10),
              onPressed: controller.logOut,
              child: Text(
                'LogOut',
                style: TextThemeX.text16.copyWith(color: redColor),
              ),
            ),
          ],
        ),
      ),
      child: Material(
        child: Column(
          children: [
            Obx(
              () => Center(
                child: CupertinoSegmentedControl<Segments>(
                  selectedColor: blueColor,
                  groupValue: controller.selectedSegment.value,
                  onValueChanged: (Segments value) {
                    controller.selectedSegment.value = value;
                  },
                  children: const <Segments, Widget>{
                    Segments.customer: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: FittedBox(child: Text('Customer')),
                    ),
                    Segments.item: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: FittedBox(child: Text('Item')),
                    ),
                    Segments.invoice: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 17),
                      child: FittedBox(child: Text('Invoice')),
                    ),
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Obx(
                () => controller.selectedSegment.value == Segments.customer
                    ? const CustomerView()
                    : controller.selectedSegment.value == Segments.item
                        ? const ItemView()
                        : controller.selectedSegment.value == Segments.invoice
                            ? const InvoiceView()
                            : const Unknown404View(),
              ),
            ),
          ],
        ),
      ).paddingOnly(top: 110),
    );
  }
}
