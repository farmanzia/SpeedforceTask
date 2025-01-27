import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:speedforcetest/utils/app_color.dart';
import 'package:speedforcetest/utils/app_paddings.dart';

class CachedImageWidget extends StatelessWidget {
 final String imageUrl;
  const CachedImageWidget({super.key,required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(60),
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        height: AppSizes().boxSize(context, 120),
        width: AppSizes().boxSize(context, 120),
        imageUrl: imageUrl,
        placeholder: (context, url) => const CircleAvatar(radius: 120, backgroundColor: AppColor.kLightWhite,child: Icon(Icons.person,),),
        errorWidget: (context, url, error) =>  const CircleAvatar( child: Icon(Icons.person),radius: 120,),
      ),
    );
  }
}