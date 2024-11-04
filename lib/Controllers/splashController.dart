import 'dart:async';

import 'package:get/get.dart';

class Splashcontroller extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Timer(const Duration(seconds: 2),()=>Get.offAndToNamed('/onboarding1'));
  }
}