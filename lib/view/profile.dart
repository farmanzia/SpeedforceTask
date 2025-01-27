import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:speedforcetest/controller/authController.dart';
import 'package:speedforcetest/utils/appImages.dart';
import 'package:speedforcetest/utils/app_paddings.dart';
import 'package:speedforcetest/utils/app_style.dart';
import 'package:speedforcetest/widget/CachedImageWidget.dart';
import 'package:speedforcetest/widget/profileActionList.dart';
import 'package:speedforcetest/widget/profileDetailsWidget.dart';

import '../utils/app_color.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});
  @override
  Widget build(BuildContext context) {
    AuthController authController=Get.put(AuthController());
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(AppSizes.medium),
      child: Obx(
        ()=>authController.isLoading.value? Center(child: const CircularProgressIndicator()):  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: AppSizes().boxSize(context, 40),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'My Profile',
                      style: medium.copyWith(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Image.asset(
                    AppImages.menu,
                    height: AppSizes().boxSize(context, 28),
                  )
                ],
              ),
              SizedBox(
                height: AppSizes().boxSize(context, 16),
              ),
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(AppImages.dotsBackground))),
                child: Column(
                  children: [
                     Center(
                      child: Stack(
                        children: [
                          CachedImageWidget(imageUrl: authController.details.value!.data.avatar.toString(),),
                          Positioned(
                              bottom: 0,
                              right: 0,
                              child: Image.asset(AppImages.editPin,
                              height: AppSizes().boxSize(context, 25),
                              ))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSizes().boxSize(context, 14),
                    ),
                    Text(
                      "${authController.details.value!.data.lastName} ${authController.details.value!.data.lastName}",
                      style: medium.copyWith(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: AppSizes().boxSize(context, 8),
                    ),
                    Text(
                      authController.details.value!.data.email,
                      style: medium.copyWith(
                          fontSize: 14, fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSizes().boxSize(context, 24),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  ProfileDetails(
                    widget: Column(
                      children: [
                        Text("Earnings",style:small.copyWith(color: AppColor.kDarkGrey),),
                        Text("\$${NumberFormat('#,##0').format(authController.details.value!.data.earnings)}",style: medium.copyWith(fontSize: 18,fontWeight: FontWeight.w700,color: AppColor.kPrimary),),
                      ],
                    ),
                  ),
                  ProfileDetails(
                    widget: Column(
                      children: [
                        Text("Ratings",style: small.copyWith(color: AppColor.kDarkGrey),),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(AppImages.rating,height: AppSizes().boxSize(context, 20),),
                            SizedBox(width: AppSizes().boxSize(context, 8),),
                            Text(authController.details.value!.data.ratings,style: medium.copyWith(fontSize: 18,fontWeight: FontWeight.w700,color: AppColor.kPrimary),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: AppSizes().boxSize(context, 24),
              ),
              Text(
                'About Me',
                style: medium.copyWith(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: AppSizes().boxSize(context, 8),
              ),
              RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore ',
                  style: medium.copyWith(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                  children: [
                    TextSpan(
                      text: 'view more...',
                      style: medium.copyWith(
                          color: AppColor.kPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w700),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSizes().boxSize(context, 16),
              ),
              const ProfileActionList(
                iconPath: AppImages.location,
                title: 'Business Location',
              ),
              SizedBox(
                height: AppSizes().boxSize(context, 16),
              ),
              const ProfileActionList(
                iconPath: AppImages.booking,
                title: 'Bookings',
              ),
              SizedBox(
                height: AppSizes().boxSize(context, 16),
              ),
              const ProfileActionList(
                iconPath: AppImages.services,
                title: 'My Services',
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
