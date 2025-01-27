import 'package:flutter/cupertino.dart';
import 'package:speedforcetest/utils/app_color.dart';
import 'package:speedforcetest/utils/app_paddings.dart';

class ProfileDetails extends StatelessWidget {
  final Widget widget;
  const ProfileDetails({super.key,required this.widget});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSizes().boxSize(context, 160),
      decoration: BoxDecoration(
          boxShadow: const [BoxShadow(color: AppColor.kShadow,blurRadius: 4,spreadRadius: 12,offset: Offset(5, 5))],
          color: AppColor.kWhite,borderRadius: BorderRadius.circular(16)),
      child: Center(child: Padding(
        padding:  EdgeInsets.symmetric(vertical: AppSizes.medium,horizontal: AppSizes.extraLarge),
        child:widget),
      ),);
  }
}