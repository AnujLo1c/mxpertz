import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mxpertx/Controllers/onboarding_controller1.dart';

class Onbording1 extends StatelessWidget {
  const Onbording1({super.key});

  @override
  Widget build(BuildContext context) {
OnboardingController1 onboardingController1=Get.put(OnboardingController1());
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: Padding(padding: EdgeInsets.symmetric(
        vertical: Get.height/4
      ),
      child: Image(image: AssetImage("assets/onboarding1.png"))),
    );
  }
}
