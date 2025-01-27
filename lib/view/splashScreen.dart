import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:speedforcetest/utils/appImages.dart';
import 'package:speedforcetest/utils/appRoutes.dart';
import 'package:speedforcetest/utils/app_color.dart';
import 'package:speedforcetest/utils/app_paddings.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 4), () {
      Get.offNamed(AppRoutes.login); // Using GetX for navigation
      });
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(AppSizes.extraLarge),
              child: Image.asset(AppImages.logo),
            ),
          ),
          Center(
              child: LoadingAnimationWidget.hexagonDots(
            color: AppColor.kPrimary,
            size: AppSizes().boxSize(context, 60),
          )),
          SizedBox(
            height: AppSizes().boxSize(context, 100),
          )
        ],
      ),
    );
  }
}
