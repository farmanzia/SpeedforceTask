import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'app_color.dart';

class AppUtils {
  AppUtils._internal();

  static final AppUtils _appUtil = AppUtils._internal();

  factory AppUtils() => _appUtil;

  Future showEasyLoading() async {
    if (!EasyLoading.isShow) {
      await EasyLoading.show(
          dismissOnTap: false,
          indicator: const SizedBox(width: 50, child: SpinKitCircle(size: 20, color: AppColor.kWhite)));
    }
  }

  Future hideEasyLoading() async {
    if (EasyLoading.isShow) {
      await EasyLoading.dismiss();
    }
  }
}