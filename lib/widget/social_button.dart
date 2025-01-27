import 'package:flutter/cupertino.dart';
import 'package:speedforcetest/utils/appImages.dart';
import 'package:speedforcetest/utils/app_color.dart';
import 'package:speedforcetest/utils/app_paddings.dart';
import 'package:speedforcetest/utils/app_style.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  const SocialButton({super.key,required this.imagePath});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes().boxSize(context, 129),
      decoration: BoxDecoration(
          boxShadow: [const BoxShadow(color: AppColor.kShadow,blurRadius: 4,spreadRadius: 12,offset: Offset(5, 5))],
          color: AppColor.kWhite,borderRadius: BorderRadius.circular(16)),
      child: Center(child: Padding(
        padding:  EdgeInsets.symmetric(vertical: AppSizes.medium),
        child:Image.asset(imagePath,height: AppSizes().boxSize(context, 24),),
      ),),);
  }
}