import 'package:alvish_nesscale_assignment/design/components/c_core_button.dart';
import 'package:alvish_nesscale_assignment/design/components/c_flat_button.dart';
import 'package:alvish_nesscale_assignment/design/components/c_header.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/invoice/add_invoice_controller.dart';
import 'package:alvish_nesscale_assignment/design/utils/design_utils.dart';
import 'package:alvish_nesscale_assignment/utils/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddInvoiceView extends GetWidget<AddInvoiceController> {
  const AddInvoiceView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CHeader(text: 'Create Invoice'),
      body: Obx(
        () => controller.isLoading.value
            ? defaultLoader()
            : Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          isExpanded: true,
                          hint: const Text('Select Customer'),
                          value: controller.selectedCustomerId,
                          items: controller.customers
                              .map<DropdownMenuItem>((customer) {
                            return DropdownMenuItem<String>(
                              value: customer.customerId,
                              child: Text(customer.name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            controller.selectedCustomerId = value;
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: GridView.builder(
                        physics: defaultPhysics,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemCount: controller.items.length,
                        itemBuilder: (context, index) {
                          final item = controller.items[index];
                          return Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              children: [
                                Text(item.name, style: TextThemeX.text16),
                                const SizedBox(height: 10),
                                Text('₹ ${item.rate}',
                                    style: TextThemeX.text14),
                                const SizedBox(height: 15),
                                GetBuilder<AddInvoiceController>(
                                  builder: (_) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: CCoreButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () => controller
                                                .decrementQuantity(item),
                                            child: const Icon(
                                              CupertinoIcons.minus_circled,
                                              color: lPrimaryColor,
                                            ),
                                          ),
                                        ),
                                        Text(controller
                                            .getQuantity(item)
                                            .toString()),
                                        Expanded(
                                          child: CCoreButton(
                                            padding: EdgeInsets.zero,
                                            onPressed: () => controller
                                                .incrementQuantity(item),
                                            child: const Icon(
                                              CupertinoIcons.plus_circled,
                                              color: lPrimaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const Spacer(),
                    Obx(() {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Obx(
                            () => Text(
                              "Total: ${controller.total} ₹",
                              style: TextThemeX.text16,
                            ),
                          ),
                          const SizedBox(height: 10),
                          CFlatButton(
                            text: 'CREATE INVOICE',
                            onPressed: controller.createInvoice,
                            isLoading: controller.isAddingInvoice.value,
                          ),
                        ],
                      ).symmentric(h: 15);
                    }),
                  ],
                ).only(
                    b: context.bottomSafeHeight,
                    l: horizontalPadding,
                    r: horizontalPadding,
                    t: 20),
              ),
      ),
    );
  }
}
