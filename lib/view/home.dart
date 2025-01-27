import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:speedforcetest/controller/authController.dart';
import 'package:speedforcetest/controller/homeController.dart';
import 'package:speedforcetest/utils/appImages.dart';
import 'package:speedforcetest/utils/app_color.dart';
import 'package:speedforcetest/utils/app_paddings.dart';
import 'package:speedforcetest/utils/app_style.dart';
import 'package:speedforcetest/widget/rectBtn.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController=Get.find<HomeController>();
    var authController=Get.find<AuthController>();
    return Scaffold(body:  Obx(
        ()=> authController.isLoading.value? const CircularProgressIndicator():  ListView(
        children: [

          Container(
            height: AppSizes().boxSize(context, 375),
            decoration: const BoxDecoration(
                color: AppColor.kPrimary,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16),bottomRight: Radius.circular(16))
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                Padding(
                  padding:  EdgeInsets.only(left: AppSizes.large,top: AppSizes.extraLarge),
                  child: Row(children: [Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text("Hello!",style: large.copyWith(fontSize: 30,fontWeight: FontWeight.w700,color: AppColor.kWhite),),
                    Text("${authController.details.value?.data.firstName} ${authController.details.value?.data.lastName}",style: large.copyWith(fontSize: 30,fontWeight: FontWeight.w700,color: AppColor.kWhite),)
                  ],)],),
                ),
                  Padding(
                    padding:  EdgeInsets.all(AppSizes.large),
                    child: Stack(
                      // alignment: AlignmentDirectional.center,
                      children: [
                      Image.asset(AppImages.whiteCurve),
                      Positioned(
                          left: 0,
                          bottom: 0,
                          child: SizedBox(
                              height: AppSizes().boxSize(context, 90),
                              child: Image.asset(AppImages.redCurve,fit: BoxFit.fill,))),
                        Positioned(
                            top: AppSizes().boxSize(context, 20),
                            left: AppSizes().boxSize(context, 30),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                              Text("My Earnings",style: large.copyWith(fontSize: 20,fontWeight: FontWeight.w700),),
                              Text("\$${NumberFormat('#,##0').format(authController.details.value!=null?authController.details.value?.data.earnings:0)}",style: large.copyWith(fontSize: 40,fontWeight: FontWeight.w700,color: AppColor.kPrimary),),
                            ],)),
                        Positioned(
                            top: AppSizes().boxSize(context, 28),
                            right: AppSizes().boxSize(context, 30),
                            child: Image.asset(AppImages.earningAvatar,height:AppSizes().boxSize(context, 149) ,)),
                    ],),
                  ),


              ],),
            ),
          ),
          SizedBox(height: AppSizes().boxSize(context, 20),),
          Center(
            child: SizedBox(
              // width: 300, // Adjust the width to control the number of items per row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return CircleAvatar(
                    radius: index < 4 ? 20 : 30, // Radius 20 for the first 4, 30 for the rest
                    backgroundImage: AssetImage(homeController.imagePats[index]),
                  );
                }),
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: AppSizes().boxSize(context, 350),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (index) {
                  return CircleAvatar(
                    radius: index < 4 ? 20 : 30,
                    backgroundImage: AssetImage(homeController.imagePats[4+index]),
                  );
                }),
              ),
            ),
          ),
          SizedBox(height: AppSizes().boxSize(context, 16),),

          Center(child: Text("Invite your friends and \nget big discounts",textAlign: TextAlign.center,style: large.copyWith(fontSize: 32,fontWeight: FontWeight.w700),)),
          SizedBox(height: AppSizes().boxSize(context, 16),),

          Center(child: Text("Invite  your other friends to our platform to get plenty\nof discounts waiting for you!",textAlign: TextAlign.center,style: large.copyWith(fontSize: 15,fontWeight: FontWeight.w500),)),
          SizedBox(height: AppSizes().boxSize(context, 16),),

           Padding(
             padding:  EdgeInsets.symmetric(horizontal: AppSizes.extraLarge),
             child: RecButton(widget: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Image.asset(AppImages.copy,height:  AppSizes().boxSize(context, 16),),SizedBox(width: AppSizes().boxSize(context, 24),) , Text("Copy Referral link",style: medium.copyWith(fontWeight: FontWeight.w700,color: AppColor.kWhite),)],),color: AppColor.kPrimary,onTap: null,),
           ),
          SizedBox(height: AppSizes().boxSize(context, 16),),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: AppSizes.extraLarge),
            child: RecButton(widget: Row(mainAxisAlignment: MainAxisAlignment.center, children: [Image.asset(AppImages.send,height:  AppSizes().boxSize(context, 20),),SizedBox(width: AppSizes().boxSize(context, 24),) , Text("Send Referral Link",style: medium.copyWith(fontWeight: FontWeight.w700,color: AppColor.kPrimary,),)],),color: AppColor.kWhite,onTap: null,),
          ),
        ],
      ),
    ));
  }
}