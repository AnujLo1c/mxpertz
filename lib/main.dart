import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mxpertx/Screens/login/otp_screen.dart';
import 'package:mxpertx/Screens/onbording/onbording2.dart';
import 'package:mxpertx/Screens/onbording/onbording3.dart';

import 'Screens/home.dart';
import 'Screens/login/login.dart';
import 'Screens/login/signup.dart';
import 'Screens/onbording/onbording1.dart';
import 'Screens/splash.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'uxeLoft',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF1A9EB7),
        primary:Color(0xFF1A9EB7),
        onPrimary:Color(0xFFFFAF00),

        // onPrimary:
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Get.theme.colorScheme.primary,
            foregroundColor: Colors.white,

          )
        ),

        useMaterial3: true,
      ),
      getPages: [
        GetPage(name: '/onboarding1', page: () => const Onbording1()),
        GetPage(name: '/onboarding2', page: () => const Onbording2()),
        GetPage(name: '/onboarding3', page: () => const Onbording3()),
        GetPage(name: '/login', page: () => const Login()),
        GetPage(name: '/otp', page: () => const OtpScreen()),
        GetPage(name: '/signup', page: () => const Signup()),
        GetPage(name: '/home', page: () => const Home()),
        GetPage(name: '/splash', page: () => const Splash()),
      ],
      initialRoute: '/splash',
unknownRoute:GetPage(name: '/onboarding2', page: () => const Onbording2()),
      home: const Placeholder(),
    );
  }
}

