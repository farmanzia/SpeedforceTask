import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:speedforcetest/view/earning.dart';
import 'package:speedforcetest/view/home.dart';
import 'package:speedforcetest/view/job.dart';
import 'package:speedforcetest/view/profile.dart';

class HomeController extends GetxController{
  RxInt selectedIndex = 0.obs;
  final List<Map<String, String>> iconPaths = [
    {
      "filled": "assets/icon/bottom_bar_icon/home_filled.png",
      "outline": "assets/icon/bottom_bar_icon/home_outline.png",
    },
    {
      "filled": "assets/icon/bottom_bar_icon/job_outline.png",
      "outline": "assets/icon/bottom_bar_icon/job_outline.png",
    },
    {
      "filled": "assets/icon/bottom_bar_icon/earning_outline.png",
      "outline": "assets/icon/bottom_bar_icon/earning_outline.png",
    },
    {
      "filled": "assets/icon/bottom_bar_icon/profile_filled.png",
      "outline": "assets/icon/bottom_bar_icon/profile_outline.png",
    },
  ];
  final List<String> labels = ["Home", "Jobs", "Earnings", "Profile"];

  final List<String> imagePats=['assets/avatar/avatar1.png','assets/avatar/avatar2.png','assets/avatar/avatar3.png','assets/avatar/avatar4.png','assets/avatar/avatar5.png','assets/avatar/avatar6.png','assets/avatar/avatar7.png'];

  List<Widget> homeWidget=<Widget>[const Home(),Job(),Earning(),Profile()].obs;

  void onItemTapped(int index) {
      selectedIndex.value = index;
  }
}