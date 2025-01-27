import 'package:get/get.dart';
import 'package:speedforcetest/controller/authController.dart';
import 'package:speedforcetest/controller/homeController.dart';
class AppControllerBinding implements Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(()=>HomeController(),fenix: true);
    Get.lazyPut(()=>AuthController(),fenix: true);
  }
}