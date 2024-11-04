import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mxpertx/Widgets/bottom_sheet.dart';

class OnboardingController2 extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(Duration(
      milliseconds: 400
    ), () =>
        showBottomSheet('online payment', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
            ' Pharetra quam elementum massa, viverra. Ut turpis consectetur. ',
        () {
          Get.toNamed('/onboarding3');
        },
        )
      ,);
 }
}