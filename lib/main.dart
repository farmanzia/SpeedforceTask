import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:speedforcetest/utils/app_color.dart';
import 'package:speedforcetest/view/myApp.dart';

Future<void> main() async {
  // await dotenv.load(fileName: '.env');
  runApp(const MyApp());
  configLoading();

}
void configLoading() {
  EasyLoading.instance
    ..loadingStyle = EasyLoadingStyle.custom
    ..progressColor = AppColor.kWhite
    ..backgroundColor = AppColor.kPurple.withOpacity(0.9)
    ..maskColor = AppColor.kPurple.withOpacity(0.9)
    ..indicatorColor = AppColor.kWhite
    ..textColor = AppColor.kWhite
    ..userInteractions = false
    ..dismissOnTap = false;
}

