import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:heroes/app/bindings/home_binding.dart';

import 'package:heroes/app/routes/app_pages.dart';
import 'package:heroes/app/routes/app_route.dart';

import 'app/ui/theme/app_theme.dart';
import 'app/ui/utils/app_string.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.APP_MATERIAL_TITLE,
      theme: appThemeData,
      defaultTransition: Transition.rightToLeftWithFade,
      initialBinding: HomeBinding(),
      initialRoute: AppRoute.HOME,
      getPages: AppPages.pages,
    );
  }
}
