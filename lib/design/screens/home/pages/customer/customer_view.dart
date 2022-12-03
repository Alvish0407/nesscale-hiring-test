import 'package:alvish_nesscale_assignment/core/models/customer_model.dart';
import 'package:alvish_nesscale_assignment/design/components/c_core_button.dart';
import 'package:alvish_nesscale_assignment/design/components/key_value.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/customer/customer_controller.dart';
import 'package:alvish_nesscale_assignment/design/utils/design_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CustomerView extends StatelessWidget {
  const CustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
      init: CustomerController(),
      builder: (controller) {
        return Obx(
          () => controller.isLoading.value
              ? defaultLoader()
              : ValueListenableBuilder(
                  valueListenable: controller.customerBox.listenable(),
                  builder: (context, Box<Customer> box, _) {
                    return ListView.builder(
                      itemCount: box.length,
                      padding: EdgeInsets.zero,
                      physics: defaultPhysics,
                      itemBuilder: (context, index) {
                        final Customer? customer = box.getAt(index);
                        return (customer?.isDeleted ?? true)
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
                                          KeyValue(
                                              'Customer Name', customer?.name),
                                          KeyValue('Customer Mobile No.',
                                              customer?.mobileNo),
                                          KeyValue('Customer Email',
                                              customer?.email),
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
                                        controller.removeCustomer(customer),
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
