import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedforcetest/utils/app_color.dart';
import 'package:speedforcetest/utils/app_paddings.dart';
import 'package:speedforcetest/utils/app_style.dart';

class AppButton extends StatelessWidget {
 final String title;
 final Function()? onTap;
  const AppButton({super.key,required this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: AppColor.kPrimary,borderRadius: BorderRadius.circular(16)),
        child: Center(child: Padding(
          padding:  EdgeInsets.symmetric(vertical: AppSizes.medium),
          child: Text(title,style: medium.copyWith(color: AppColor.kWhite,fontSize: 16,fontWeight: FontWeight.w700),),
        ),),),
    );
  }
}
