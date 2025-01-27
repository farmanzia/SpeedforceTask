import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedforcetest/controller/homeController.dart';
import 'package:speedforcetest/utils/app_color.dart';
import 'package:speedforcetest/utils/app_style.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {

    HomeController homeController=Get.find<HomeController>();

    return  Obx(
      ()=> Scaffold(body:

          homeController.homeWidget[homeController.selectedIndex.value]
     ,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColor.kWhite,
          currentIndex: homeController.selectedIndex.value,
          onTap: homeController.onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: small.copyWith(color: AppColor.kPrimary),
          items: List.generate(homeController.labels.length, (index) {
            final isSelected = homeController.selectedIndex.value == index;
            return BottomNavigationBarItem(
              icon: Image.asset(
                isSelected ? homeController.iconPaths[index]["filled"]! : homeController.iconPaths[index]["outline"]!,
                width: 24,
                height: 24,
              ),
              label: homeController.labels[index],
            );
          }),
          selectedItemColor:AppColor.kPrimary, // Color for selected item text
          unselectedItemColor: Colors.grey, // Color for unselected item text
          showUnselectedLabels: true,
        ),

      ),
    );
  }
}
