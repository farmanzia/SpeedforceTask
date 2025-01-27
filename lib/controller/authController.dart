import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:speedforcetest/model/rx_nullale.dart';
import 'package:speedforcetest/model/user_model.dart';
import 'package:speedforcetest/service/api_services.dart';

class AuthController extends GetxController{
  final formKey=GlobalKey<FormState>();

  final email = TextEditingController();
  final password = TextEditingController();
  TextEditingController firstName=TextEditingController();
  TextEditingController lastName=TextEditingController();
  TextEditingController signingEmail=TextEditingController();
  TextEditingController gender=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController signingPassword=TextEditingController();
  TextEditingController signingConfirmPassword=TextEditingController();
  Rx<UserDetails?> details = RxNullable<UserDetails?>().setNull();
  RxBool isLoading=false.obs;


  @override
  void onInit() {
    fetchData("https://my-json-server.typicode.com/hameezk/HiringTask/login");

    // fetchData("${dotenv.env['API_POINT']!}/login");
    // TODO: implement onInit
    super.onInit();
  }

  // @override
  // onReady(){
  //   fetchData("https://my-json-server.typicode.com/hameezk/HiringTask/login");
  //   super.onReady();
  // }


  Future<void> fetchData(String endpoint) async {
    // if(isLoading.isTrue){
      try {
        isLoading(true);
        final result = await HttpApiService().get(endpoint: endpoint);
        details.value =
            UserDetails.fromJson(result); // Update the reactive variable
      } catch (e) {
        print('Error fetching data: $e');
        details.value = null; // Handle errors gracefully
      } finally {
        isLoading(false);
      }
    // }
  }
}