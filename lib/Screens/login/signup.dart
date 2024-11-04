import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:mxpertx/Controllers/login/signup_controller.dart';
import 'package:mxpertx/google_sign_in.dart';

class Signup extends StatelessWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    SignupController signupController = Get.put(SignupController());
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create Account",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Gap(20)
,          Text(
            "Sign Up",
            style: TextStyle(fontSize: 16),
          ),
          Gap(40),
          _customTextField(signupController.emailtec, Icons.mail_outline_outlined,"Email"),
          Gap(15),
          _customTextFieldObs(signupController.passtec, Icons.lock_open,'Special Characters ', true, signupController),
          Gap(15),
          _customTextFieldObs(signupController.confirmpasstec, Icons.lock_open,'Repeat Password ', false, signupController),
          Gap(15),
          Container(
            // width: Get.width-30,
            margin: EdgeInsets.symmetric(horizontal: 30),



            height: 53,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: Colors.grey.shade200)),
            child:
                Row(
                  children: [
                    CountryCodePicker(
                      onChanged: print,

                      initialSelection: 'IN',
                      // favorite: ['+91','IN'],

                      showCountryOnly: false,

                      showOnlyCountryWhenClosed: false,

                      alignLeft: false,

                      boxDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                      ),

                    ),
                    Flexible(
                      child: TextField(


                        controller: signupController.phonetec,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: "Mobile Number",
                          labelStyle: TextStyle(color: Colors.grey.shade500,fontSize: 14),

                        ),
                      ),
                    ),
                  ],
                ),
            ),
          Gap(60),
          ElevatedButton(onPressed: (){},
              style: ElevatedButton.styleFrom(minimumSize: Size(Get.width-50, 60)),
              child: Text("NEXT",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
          Gap(30),
          Text("Or Continue With",style: TextStyle(fontSize: 12),),

          Gap(30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _LoginButton("assets/apple.png",'Apple'),
              GestureDetector(
               onTap: () {
GoogleSignInAL().signInGoogle();
               },
                child:

              _LoginButton("assets/google.png",'Google'),
              ),
              _LoginButton("assets/fb.png",'Facebook'),
            ],
          )

        ],
      ),
    );
  }

  Widget _customTextFieldObs(TextEditingController controller, IconData icon,
      String title, bool obscure, SignupController signUpController) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),

      
      
      height: 53,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade200)),
      child: Obx(()=>
        TextField(

          obscureText: obscure?signUpController.pass.value:signUpController.confirmPass.value,
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              labelText: title,
              labelStyle: TextStyle(color: Colors.grey.shade500,fontSize: 14),
              prefixIcon: Icon(
                icon,
                size: 18,
                color: Colors.grey.shade400,
              ),
            suffixIcon: IconButton(onPressed: (){
              if(obscure){
                signUpController.togglePass();
              }
              else
                {
                  signUpController.toggleConfirmPass();
                }
            }, icon: Icon(Icons.remove_red_eye,color: Colors.grey.shade300,size: 18,))
          ),
        ),
      ),
    );
  }
  Widget _customTextField(TextEditingController controller, IconData icon,
      String title,) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      
      
      
      height: 53,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.grey.shade200)),
      child:
          TextField(

            
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                labelText: title,
                labelStyle: TextStyle(color: Colors.grey.shade500,fontSize: 14),
                prefixIcon: Icon(
                  icon,
                  size: 18,
                  color: Colors.grey.shade400,
                ),

            ),
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
