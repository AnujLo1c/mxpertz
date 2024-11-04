import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mxpertx/Controllers/onboarding_controller2.dart';

class Onbording2 extends StatelessWidget {
  const Onbording2({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController2 onboardingController1=Get.put(OnboardingController2());
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: Padding(padding: EdgeInsets.symmetric(
          vertical: Get.height/4
      ),
          child: Image(image: AssetImage("assets/onboarding2.png"))),
    );
  }
}
