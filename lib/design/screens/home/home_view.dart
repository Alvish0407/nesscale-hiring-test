import 'package:alvish_nesscale_assignment/core/routes/app_pages.dart';
import 'package:alvish_nesscale_assignment/design/components/c_core_button.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/home_controller.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/customer/customer_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/invoice/invoice_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/item/item_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/unknown_404_view.dart';
import 'package:alvish_nesscale_assignment/design/utils/design_utils.dart';
import 'package:alvish_nesscale_assignment/utils/enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: CCoreButton(
          onPressed: () => Get.toNamed(Routes.PROFILE),
          child: Row(
            children: [
              const Icon(
                CupertinoIcons.person_alt_circle,
                size: 30,
                color: lPrimaryColor,
              ),
              const SizedBox(width: 5),
              Text(
                'Alvish',
                style: TextThemeX.text16.copyWith(color: lPrimaryColor),
              ),
            ],
          ),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: controller.add,
          child: const Text('Add'),
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
