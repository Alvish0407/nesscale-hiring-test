// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alvish_nesscale_assignment/core/models/customer_model.dart';
import 'package:alvish_nesscale_assignment/core/models/invoice_model.dart';
import 'package:alvish_nesscale_assignment/core/models/item_model.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/home_controller.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/home_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/customer/add_customer_controller.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/customer/add_customer_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/invoice/add_invoice_controller.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/invoice/add_invoice_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/item/add_item_controller.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/pages/item/add_item_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/profile/profile_controller.dart';
import 'package:alvish_nesscale_assignment/design/screens/profile/profile_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/startup/signin/signin_controller.dart';
import 'package:alvish_nesscale_assignment/design/screens/startup/signin/signin_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/startup/splash/splash_controller.dart';
import 'package:alvish_nesscale_assignment/design/screens/startup/splash/splash_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/unknown_404_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/instance_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'app_routes.dart';

class AppPages {
  // ignore: constant_identifier_names
  static const INITIAL = Routes.SPLASH;

  static final unknownRoute = GetPage(
    name: _Paths.UNKNOWN_404,
    page: () => const Unknown404View(),
  );

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: BindingsX._splashBindings(),
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => const SignInView(),
      binding: BindingsX._signInBindings(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      children: [
        GetPage(
          name: _Paths.ADD_CUSTOMER,
          page: () => const AddCustomerView(),
          binding: BindingsX._addCustomerBindings(),
        ),
        GetPage(
          name: _Paths.ADD_ITEM,
          page: () => const AddItemView(),
          binding: BindingsX._addItemBindings(),
        ),
        GetPage(
          name: _Paths.ADD_INVOICE,
          page: () => const AddInvoiceView(),
          binding: BindingsX._addInvoiceBindings(),
        ),
        GetPage(
          name: _Paths.PROFILE,
          page: () => const ProfileView(),
          binding: BindingsX._profileBindings(),
        ),
      ],
      binding: BindingsX._homeBindings(),
    ),
  ];
}

class BindingsX {
  static BindingsBuilder initialBindigs() {
    return BindingsBuilder(() async {
      await Hive.openBox<Customer>("customers");
      await Hive.openBox<Item>("items");
      await Hive.openBox<Invoice>("invoices");
    });
  }

  static BindingsBuilder<dynamic> _signInBindings() {
    return BindingsBuilder(() {
      Get.lazyPut<SignInController>(
        () => SignInController(),
      );
    });
  }

  static BindingsBuilder<dynamic> _splashBindings() {
    return BindingsBuilder(() {
      Get.lazyPut<SplashController>(
        () => SplashController(),
      );
    });
  }

  static BindingsBuilder<dynamic> _homeBindings() {
    return BindingsBuilder(() {
      Get.lazyPut<HomeController>(
        () => HomeController(),
      );
    });
  }

  static BindingsBuilder<dynamic> _addCustomerBindings() {
    return BindingsBuilder(() {
      Get.lazyPut<AddCustomerController>(
        () => AddCustomerController(),
      );
    });
  }

  static BindingsBuilder<dynamic> _addItemBindings() {
    return BindingsBuilder(() {
      Get.lazyPut<AddItemController>(
        () => AddItemController(),
      );
    });
  }

  static BindingsBuilder<dynamic> _addInvoiceBindings() {
    return BindingsBuilder(() {
      Get.lazyPut<AddInvoiceController>(
        () => AddInvoiceController(),
      );
    });
  }

  static BindingsBuilder<dynamic> _profileBindings() {
    return BindingsBuilder(() {
      Get.lazyPut<ProfileController>(
        () => ProfileController(),
      );
    });
  }
}
