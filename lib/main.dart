import 'package:alvish_nesscale_assignment/core/routes/app_pages.dart';
import 'package:alvish_nesscale_assignment/core/services/gs_services.dart';
import 'package:alvish_nesscale_assignment/core/services/hive_db.dart';
import 'package:alvish_nesscale_assignment/design/components/unfocus_wrapper.dart';
import 'package:alvish_nesscale_assignment/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await GSServices.initialize();
  await HiveDB().initHive();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnFocusWrapper(
      child: GetMaterialApp(
        title: 'Alvish Nesscale',
        scrollBehavior: ScrollConfiguration.of(context).copyWith(
            scrollbars: false, physics: const BouncingScrollPhysics()),
        getPages: AppPages.routes,
        initialRoute: AppPages.INITIAL,
        debugShowCheckedModeBanner: false,
        unknownRoute: AppPages.unknownRoute,
        defaultTransition:
            kIsWeb ? Transition.circularReveal : Transition.cupertino,
        initialBinding: BindingsX.initialBindigs(),
        transitionDuration: const Duration(milliseconds: 600),
      ),
    );
  }
}
