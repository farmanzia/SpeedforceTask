import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:speedforcetest/utils/app_color.dart';
import 'package:speedforcetest/utils/app_paddings.dart';
import 'package:speedforcetest/utils/app_style.dart';

class RecButton extends StatelessWidget {
  final Widget widget;
  final Color? color;
  final Color? borderColor;
  final Function()? onTap;

  const RecButton({super.key,required this.widget,required this.color,this.borderColor,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: color,borderRadius: BorderRadius.circular(5),
        border: Border.all(color: borderColor??AppColor.kPrimary)
        ),
        child: Center(child: Padding(
          padding:  EdgeInsets.symmetric(vertical: AppSizes.medium),
          child: widget,
        ),),),
    );
  }
}
