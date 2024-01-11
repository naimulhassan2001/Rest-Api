import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest_api/theme/light_theme.dart';
import 'core/app_route/app_route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      transitionDuration: const Duration(milliseconds: 200),
      initialRoute: AppRoute.home,
      navigatorKey: Get.key,
      getPages: AppRoute.routes,
    );
  }
}
