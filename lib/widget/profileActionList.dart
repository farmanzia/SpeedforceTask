import 'package:flutter/material.dart';
import 'package:speedforcetest/utils/appImages.dart';
import 'package:speedforcetest/utils/app_color.dart';
import 'package:speedforcetest/utils/app_paddings.dart';
import 'package:speedforcetest/utils/app_style.dart';

class ProfileActionList extends StatelessWidget {
 final String iconPath;
 final String title;
  const ProfileActionList({super.key,required this.iconPath,required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: AppColor.kDivider,
        ),
        SizedBox(
          height: AppSizes().boxSize(context, 16),
        ),
        Row(
          children: [
            Image.asset(
              iconPath,
              height: AppSizes().boxSize(context, 18),
            ),
            SizedBox(
              width: AppSizes().boxSize(context, 16),
            ),
            Expanded(
                child: Text(
              title,
              style: medium.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
            )),
            Image.asset(
              AppImages.arrowForward,
              height: AppSizes().boxSize(context, 14),
            )
          ],
        )
      ],
    );
  }
}
