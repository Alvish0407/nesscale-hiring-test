// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:alvish_nesscale_assignment/design/screens/home/home_controller.dart';
import 'package:alvish_nesscale_assignment/design/screens/home/home_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/startup/signin/signin_controller.dart';
import 'package:alvish_nesscale_assignment/design/screens/startup/signin/signin_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/startup/splash/splash_controller.dart';
import 'package:alvish_nesscale_assignment/design/screens/startup/splash/splash_view.dart';
import 'package:alvish_nesscale_assignment/design/screens/unknown_404_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/instance_manager.dart';

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
      binding: BindingsX._homeBindings(),
    ),
  ];
}

class BindingsX {
  static BindingsBuilder initialBindigs() {
    return BindingsBuilder(() {});
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
}
