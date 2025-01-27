import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:speedforcetest/app_binding/binding_controller.dart';
import 'package:speedforcetest/utils/appRoutes.dart';
import 'package:speedforcetest/utils/app_color.dart';
import 'package:speedforcetest/utils/app_pages.dart';
import 'package:speedforcetest/view/landing.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SpeedForce Assessment',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColor.kWhite
      ),
      home:const Landing(),
      initialBinding: AppControllerBinding(),
      initialRoute: AppRoutes.splash,
      getPages:  appPages,
      builder: EasyLoading.init(),
    );
  }
}
