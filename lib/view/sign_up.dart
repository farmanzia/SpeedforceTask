import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:speedforcetest/controller/authController.dart';
import 'package:speedforcetest/utils/appImages.dart';
import 'package:speedforcetest/utils/appRoutes.dart';
import 'package:speedforcetest/utils/app_color.dart';
import 'package:speedforcetest/utils/app_paddings.dart';
import 'package:speedforcetest/utils/app_style.dart';
import 'package:speedforcetest/widget/app_button.dart';
import 'package:speedforcetest/widget/app_dialog.dart';
import 'package:speedforcetest/widget/app_textformfield.dart';
import 'package:speedforcetest/widget/social_button.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {
    var authController=Get.find<AuthController>();
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          toolbarHeight: 0, // Hide the default AppBar
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSizes.medium),
          child: Form(
            key:authController.formKey,
            child: ListView(
              children: [
                SizedBox(
                  height: AppSizes().boxSize(context, 16),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: ()=>Get.back(),
                      child: Image.asset(
                        AppImages.backArrow,
                        height: AppSizes().boxSize(context, 16),
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: AppSizes().boxSize(context, 16),
                    ),
                    Text(
                      'Create account',
                      style: medium.copyWith(
                          fontSize: 24, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
                SizedBox(
                  height: AppSizes().boxSize(context, 16),
                ),
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: AppSizes.medium ,vertical:AppSizes.medium),
                  height: AppSizes().boxSize(context, 48),
                  decoration: BoxDecoration(
                    color: AppColor.kWhite,
                    boxShadow: [
                      BoxShadow(
                          color: AppColor.kTabShadow,
                          blurRadius: 1,
                          spreadRadius: 1,
                          offset: const Offset(0, 1))
                    ],
                    borderRadius: BorderRadius.circular(
                      16,
                    ),
                  ),
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorWeight: 0,
                    splashBorderRadius: BorderRadius.circular(
                      16,
                    ),
                    labelPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),

                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        16.0,
                      ),
                      color: AppColor.kPrimary,
                    ),
                    labelStyle: TextStyle(
                      color: AppColor.kWhite,
                      fontSize: AppSizes().responsiveFontSize(context, 16),
                      fontFamily: 'Segoe UI',
                      fontWeight: FontWeight.w400,
                    ),
                    unselectedLabelColor: AppColor.kPrimary,
                    tabs: [
                      Tab(
                        child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Consumer',
                              style: medium.copyWith(
                                  fontWeight: FontWeight.w800, fontSize: AppSizes().responsiveFontSize(context, 20)),
                            )),
                      ),
                      Tab(
                        child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Service Provider',
                              style: medium.copyWith(
                                  fontWeight: FontWeight.w800, fontSize: AppSizes().responsiveFontSize(context, 20)),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSizes().boxSize(context, 14),),
                AppTextFormField(
                  controller: authController.firstName,
                  hintText: 'First Name',
                  validator: (val){
                    if (val == '' || val!.isEmpty) {
                      return 'First name is required';
                    } else if (val.length < 5) {
                      return 'field should contain a minimum of 5 characters.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSizes().boxSize(context, 14),),
                AppTextFormField(
                  controller: authController.lastName,
                  hintText: 'Last Name',
                  validator: (val){
                    if (val == '' || val!.isEmpty) {
                      return 'Last name is required';
                    } else if (val.length < 5) {
                      return 'field should contain a minimum of 5 characters.';
                    }
                    return null;
                  },
                ),
                SizedBox(height: AppSizes().boxSize(context, 14),),
                AppTextFormField(
                  controller: authController.signingEmail,
                  hintText: 'Email',
                  validator: (val){
                      if (val == '' || val!.isEmpty) {
                      return "Email is required";
                      } else if (!val.contains("@")) {
                      return "Please enter a valid email address";
                      }
                      return null;
                  },
                  suffixIcon: Container(
                    margin: EdgeInsets.all( AppSizes().boxSize(context, 14)),
                    child: Image.asset(AppImages.messageOutline,height: 12,width: 12,),
                  ),
                ),
                SizedBox(height: AppSizes().boxSize(context, 14),),
                GestureDetector(
                  onTap:()  {
                log("====");
                showGenderDropdown(context, authController.gender);},
                  child: AppTextFormField(
                    controller: authController.gender,
                    enable: false,
                    hintText: 'Gender',
                    validator: (val){
                      if (val == null || val.isEmpty) {
                        return 'Please select your gender';
                      }
                      return null;
                    },
                    suffixIcon: Container(
                      margin: EdgeInsets.all( AppSizes().boxSize(context, 14)),
                      child: Image.asset(AppImages.arrowDown,height: 12,width: 12,),
                    ),
                  ),
                ),
                SizedBox(height: AppSizes().boxSize(context, 14),),
                    Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            width: MediaQuery.of(context).size.width * 0.9,
            child: IntlPhoneField(
              controller: authController.phone,
              decoration: InputDecoration(
                hintText: "Phone Number",
                hintStyle: TextStyle(
                  color: Colors.grey[400],
                  fontSize: 16.0,
                ),
                filled: true,
                fillColor: AppColor.kLightWhite,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              initialCountryCode: 'US', // Default country
              onChanged: (phone) {
                print("Full Phone Number: ${phone.completeNumber}");
                print("Country Code: ${phone.countryCode}");
                print("Phone Number: ${phone.number}");
              },
              onCountryChanged: (country) {
              },
              validator: (val){
                if (val == null || val.completeNumber.isEmpty) {
                  return 'Please enter country';
                }
                return null;
              },
            ),
                    ),
                SizedBox(height: AppSizes().boxSize(context, 14),),

                AppTextFormField(
                  controller: authController.signingPassword,
                  hintText: 'Password',
                  validator: (val){
                    if (val == '' || val!.isEmpty) {
                      return 'Password is required';
                    } else if (val.length < 7) {
                      return 'Your password should contain a minimum of 7 characters.';
                    }
                    return null;
                  },
                  suffixIcon: Container(
                      margin: EdgeInsets.all( AppSizes().boxSize(context, 14)),

                      child: Image.asset(AppImages.lockOutline,height: 12,width: 12,)),
                ),
                SizedBox(height: AppSizes().boxSize(context, 14),),

                AppTextFormField(
                  controller: authController.signingConfirmPassword,
                  hintText: 'Confirm Password',
                  validator: (val){
                    if (val == '' || val!.isEmpty) {
                      return 'Confirm password is required';
                    } else if (val.length < 7) {
                      return 'Your password should contain a minimum of 7 characters.';
                    }
                    return null;
                  },
                  suffixIcon:Container(
                      margin: EdgeInsets.all( AppSizes().boxSize(context, 14)),
                      child: Image.asset(AppImages.lockOutline,height: 12,width: 12,)),
                ),
                SizedBox(height: AppSizes().boxSize(context, 14),),

                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'By continuing you agree to our ',
                    style: medium.copyWith(
                      color: Colors.grey,

                    ),
                    children: [
                      TextSpan(
                        text: 'Terms of Service',
                        style: medium.copyWith(
                          color: AppColor.kPurple,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          },
                      ),
                       TextSpan(
                        text: ' and ',
                        style: medium.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
                        style: medium.copyWith(
                          color: AppColor.kPurple,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSizes().boxSize(context, 14),),
                 AppButton(title: 'Sign Up',onTap: (){
                   if(authController.formKey.currentState!.validate()){
                     if(authController.signingPassword.text.trim() != authController.signingConfirmPassword.text.trim()){
                       showWrongPasswordDialog("password didn't matched");
                     }else{
                       Get.offAllNamed(AppRoutes.home);
                     }
                   }
                 },),
                SizedBox(height: AppSizes().boxSize(context, 24),),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have an account? ',style: small.copyWith(color: AppColor.kGrey),),
                    GestureDetector(
                        onTap: ()=>Get.toNamed(AppRoutes.login),
                        child: Text('Log In',style: small.copyWith(fontSize: 14,fontWeight: FontWeight.w600,color: AppColor.kBlue),))
                  ],),
                SizedBox(height: AppSizes().boxSize(context, 24),),

                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Divider(
                          color: Colors.grey, // Line color
                          thickness: 0.2,       // Line thickness
                          endIndent: 8,       // Space between line and text
                        ),
                      ),
                      Text(
                        'or continue with',
                        style: small.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                      const Expanded(
                        child: Divider(
                          color: Colors.grey,
                          thickness: 0.2,
                          indent: 8, // Space between line and text
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSizes().boxSize(context, 40),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SocialButton(imagePath: AppImages.facebook),
                    SizedBox(width: AppSizes().boxSize(context, 40),),
                    const SocialButton(imagePath: AppImages.google),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
   showGenderDropdown(BuildContext context,TextEditingController controller) {
    showModalBottomSheet(
      context: context,
      backgroundColor: AppColor.kWhite,
      builder: (context) {
        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ListTile(
              title: const Text('Male'),
              onTap: () {
                controller.text = 'Male';
                Get.back();
              },
            ),
            ListTile(
              title: const Text('Female'),
              onTap: () {
                controller.text = 'Female';
                Get.back();
              },
            ),
            ListTile(
              title: const Text('Other'),
              onTap: () {
                controller.text = 'Other';
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
