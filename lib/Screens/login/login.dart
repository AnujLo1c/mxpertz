import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:mxpertx/Controllers/login/login_controller.dart';
import 'package:mxpertx/google_sign_in.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController loginController=LoginController();
    return Scaffold(
      body: Column(
        children: [
          Gap(50),
          Align(
            alignment: Alignment.topRight,
      child: Text('X  ',style: TextStyle(fontWeight: FontWeight.bold,

      fontSize: 16),),),
Gap(20)
,Image(image: AssetImage("assets/splash.png",),width: 150,),
          Gap(40),
          Text("Welcome Back!",
            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),
          ),
          Gap(12),
          Text("Login to continue",style: TextStyle(fontSize: 16),),
          Gap(40),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            // padding: EdgeInsets.symmetric(
            //
            //     horizontal: 20),
            height: 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey.shade200)
            ),
            child: TextField(
              controller: loginController.phoneTec,
              decoration: InputDecoration(
                border: InputBorder.none,
                labelText: "Phone Number",
labelStyle: TextStyle(color: Colors.grey.shade500),
                prefixIcon: Icon(Icons.mobile_screen_share,color: Colors.grey.shade400,)
              ),

            ),
          ),
          Gap(30),
          ElevatedButton(onPressed: (){
            Get.toNamed('/otp');
          },
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(Get.width-60, 60)
              ),
              child: Text("GET OTP",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
       Spacer(),
       Text("Or Continue With",style: TextStyle(fontSize: 12),),
          Gap(40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  GoogleSignInAL().signInGoogle();
                },
                child:
_LoginButton('assets/google.png', 'Google'),),
_LoginButton('assets/fb.png', 'Facebook')

            ],
          ),
          Gap(60),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?"),
              TextButton(

                style: TextButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.zero,
                ),
                onPressed: (){}, child: Text("Sign Up",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,decoration: TextDecoration.underline,decorationColor: Get.theme.colorScheme.primary,decorationThickness: 2),),

              )
            ],
          ),
          Gap(40)
        ],
      ),
    );
  }
  _LoginButton(path, title){
    return SizedBox(
      height: 57,
      width: 100,
      child: Card(
color: Colors.white,
        elevation: 1,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(path,),height: 20,),
            Text(title,)
          ],
        ),
      ),
    );
  }
}
