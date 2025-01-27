import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:speedforcetest/controller/authController.dart';
import 'package:speedforcetest/utils/appImages.dart';
import 'package:speedforcetest/utils/appRoutes.dart';
import 'package:speedforcetest/utils/app_color.dart';
import 'package:speedforcetest/utils/app_paddings.dart';
import 'package:speedforcetest/utils/app_style.dart';
import 'package:speedforcetest/utils/app_utils.dart';
import 'package:speedforcetest/widget/app_button.dart';
import 'package:speedforcetest/widget/app_dialog.dart';
import 'package:speedforcetest/widget/app_textformfield.dart';
import 'package:speedforcetest/widget/social_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var authController=Get.put(AuthController());

  final login = GlobalKey<FormState>();
  RxBool isObscure = false.obs;
  RxBool rememberMe = false.obs;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: AppSizes.large,
                vertical: AppSizes.small), // Add padding for better UI
            child: Form(
              key: login,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Image.asset(
                          AppImages.backArrow,
                          height: AppSizes().boxSize(context, 20),
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: AppSizes().boxSize(context, 24)),
                    Image.asset(AppImages.logo,
                        height: AppSizes().boxSize(context, 110)),
                    SizedBox(
                      height: AppSizes().boxSize(context, 14),
                    ),
                    Center(
                      child: Text(
                        'Well Come',
                        style: TextStyle(
                            fontFamily: 'Urbanist-Regular',
                            fontSize:
                                AppSizes().responsiveFontSize(context, 32),
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: AppSizes().boxSize(context, 14),
                    ),
                    AppTextFormField(
                      controller: authController.email,
                      prefixIcon: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Icon(
                            Icons.mail,
                            color: AppColor.kPurple,
                          )),
                      hintText: 'Email',
                      validator: (val) {
                        if (val == '' || val!.isEmpty) {
                          return "Email is required";
                        } else if (!val.contains("@")) {
                          return "Please enter a valid email address";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: AppSizes().boxSize(context, 14),
                    ),
                    AppTextFormField(
                      controller: authController.password,
                      obscureText: isObscure.value,
                      enable: true,
                      prefixIcon: Padding(
                        padding: EdgeInsets.all(AppSizes.small),
                        child: const Icon(
                          Icons.lock,
                          color: AppColor.kPurple,
                        ),
                      ),
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(AppSizes.medium),
                        child: GestureDetector(
                          onTap: () {
                            isObscure.value = !isObscure.value;
                          },
                          child: Icon(
                            isObscure.isTrue
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: AppColor.kPurple,
                          ),
                        ),
                      ),
                      hintText: 'Password',
                      validator: (val) {
                        if (val == '' || val!.isEmpty) {
                          return 'Password is required';
                        } else if (val.length < 7) {
                          return 'Your password should contain a minimum of 7 characters.';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: AppSizes().boxSize(context, 14),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: rememberMe.value,
                          onChanged: (val) {
                            rememberMe.value = val!;
                          },
                          activeColor: AppColor.kPrimary,
                          checkColor: Colors.white,
                          splashRadius: 13,
                          side: const BorderSide(color: AppColor.kPrimary, width: 2),
                        ),
                        Text(
                          'Remember me',
                          style: small.copyWith(fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppSizes().boxSize(context, 14),
                    ),
                    AppButton(
                      title: 'Log in',
                      onTap: () async {
                        if (login.currentState!.validate()) {
                          if (authController.email.text.trim() == "user@speedforce.com" &&
                              authController.password.text.trim() == "password") {
                            AppUtils().showEasyLoading();
                            log("Login Successful");
                            await Future.delayed(const Duration(seconds: 4)).whenComplete(() {
                              AppUtils().hideEasyLoading();
                              Get.offAllNamed(AppRoutes.home);
                            });
                          } else {
                            showWrongPasswordDialog('The password or email you entered is incorrect. Please try again.');
                            log("Invalid Email or Password");
                          }
                        } else {
                          log("Validation Failed");
                        }
                      },
                    ),

                    SizedBox(
                      height: AppSizes().boxSize(context, 20),
                    ),
                    Center(
                        child: Text(
                      'Forgot the password?',
                      style: small.copyWith(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColor.kPrimary),
                    )),
                    SizedBox(
                      height: AppSizes().boxSize(context, 20),
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Divider(
                              color: Colors.grey, // Line color
                              thickness: 0.2, // Line thickness
                              endIndent: 8, // Space between line and text
                            ),
                          ),
                          Text(
                            'or continue with',
                            style: small.copyWith(
                                fontSize: 14, fontWeight: FontWeight.w600),
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
                    SizedBox(
                      height: AppSizes().boxSize(context, 40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SocialButton(imagePath: AppImages.facebook),
                        SizedBox(
                          width: AppSizes().boxSize(context, 40),
                        ),
                        const SocialButton(imagePath: AppImages.google),
                      ],
                    ),
                    SizedBox(
                      height: AppSizes().boxSize(context, 40),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don’t have an account? ',
                          style: small.copyWith(color: AppColor.kGrey),
                        ),
                        GestureDetector(
                            onTap: () => Get.toNamed(AppRoutes.signup),
                            child: Text(
                              'Sign up',
                              style: small.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColor.kPrimary),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
