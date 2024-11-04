import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mxpertx/Controllers/splashController.dart';
class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    Splashcontroller splashcontroller=Get.put(Splashcontroller());
    return Scaffold(
      body: Center(child: Image(image: AssetImage('assets/splash.png'),width: 150,height: 80,)),
    );
  }
}
