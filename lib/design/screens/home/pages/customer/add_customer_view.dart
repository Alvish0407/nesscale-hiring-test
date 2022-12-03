import 'package:alvish_nesscale_assignment/design/components/c_flat_button.dart';
import 'package:alvish_nesscale_assignment/design/components/c_header.dart';
import 'package:alvish_nesscale_assignment/design/components/c_text_field.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/customer/add_customer_controller.dart';
import 'package:alvish_nesscale_assignment/design/utils/design_utils.dart';
import 'package:alvish_nesscale_assignment/design/utils/validators.dart';
import 'package:alvish_nesscale_assignment/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddCustomerView extends GetWidget<AddCustomerController> {
  const AddCustomerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CHeader(text: 'Add Customer'),
      body: Form(
        key: controller.formKey,
        child: Column(
          children: [
            CTextField(
              labelText: 'Customer Name',
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              validator: AuthValidator.emptyNullValidator,
              controller: controller.customerNameController,
            ).only(b: 10),
            CTextField(
              labelText: 'Customer Mobile Number',
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              validator: AuthValidator.phoneValidator,
              controller: controller.customerMobileController,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ).only(b: 10),
            CTextField(
              labelText: 'Customer Email',
              textInputAction: TextInputAction.done,
              validator: AuthValidator.emailValidator,
              keyboardType: TextInputType.emailAddress,
              controller: controller.customerEmailController,
            ).only(b: 10),
            const Spacer(),
            Obx(() {
              return CFlatButton(
                text: 'CREATE CUSTOMER',
                onPressed: controller.addCustomer,
                isLoading: controller.isAddingCustomer.value,
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
