import 'package:alvish_nesscale_assignment/core/models/customer_model.dart';
import 'package:alvish_nesscale_assignment/core/models/invoice_model.dart';
import 'package:alvish_nesscale_assignment/core/models/item_model.dart';
import 'package:alvish_nesscale_assignment/design/components/key_value.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/invoice/invoice_controller.dart';
import 'package:alvish_nesscale_assignment/design/utils/design_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/adapters.dart';

class InvoiceView extends StatelessWidget {
  const InvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<InvoiceController>(
      init: InvoiceController(),
      builder: (controller) {
        return ValueListenableBuilder(
          valueListenable: controller.invoiceBox.listenable(),
          builder: (context, Box<Invoice> box, _) {
            return ListView.builder(
              itemCount: box.length,
              padding: EdgeInsets.zero,
              physics: defaultPhysics,
              itemBuilder: (context, index) {
                final Invoice? item = box.getAt(index);
                final Customer? customer =
                    controller.customerBox.get(item?.customerId);
                return Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                    left: horizontalPadding,
                    right: horizontalPadding,
                  ),
                  padding: const EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: pureBlackColor.withOpacity(.33)),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Column(
                    children: [
                      KeyValue('Date', item?.dateTime.toString()),
                      KeyValue('Customer Name', customer?.name),
                      Text(
                        "Products",
                        style: TextThemeX.text18.copyWith(color: lPrimaryColor),
                      ),
                      ...item!.orderedItem.map((orderedItem) {
                        final Item? item =
                            controller.itemBox.get(orderedItem.itemId);
                        return KeyValue(
                          item!.name,
                          "${orderedItem.quantity} x ${item.rate} ₹ = ${orderedItem.quantity * item.rate} ₹",
                        );
                      }).toList(),
                      const Divider(),
                      KeyValue('Grand Total', "${item.total} ₹"),
                      const SizedBox(height: 15),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
