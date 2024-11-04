import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mxpertx/Controllers/onboarding_controller3.dart';

class Onbording3 extends StatelessWidget {
  const Onbording3({super.key});

  @override
  Widget build(BuildContext context) {
    OnboardingController3 onboardingController1=Get.put(OnboardingController3());
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.primary,
      body: Padding(padding: EdgeInsets.symmetric(
          vertical: Get.height/4
      ),
          child: Image(image: AssetImage("assets/onboarding2.png"))),
    );
  }
}
