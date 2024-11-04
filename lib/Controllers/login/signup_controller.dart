import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  RxBool pass=true.obs;
  RxBool confirmPass=true.obs;
TextEditingController emailtec=TextEditingController();
TextEditingController passtec=TextEditingController();
TextEditingController confirmpasstec=TextEditingController();
TextEditingController phonetec=TextEditingController();

  togglePass(){
    pass.value=!pass.value;
  }
  toggleConfirmPass(){
    confirmPass.value=!confirmPass.value;
  }
  upload(){
    String e=emailtec.text;
    String p=passtec.text;
    String c=confirmpasstec.text;
    if(e.isEmpty){
      Get.snackbar("Empty Field", "Email empty",backgroundColor: Colors.redAccent);
      return;
    }
    if(p.isEmpty){
      Get.snackbar("Empty Field", "Password empty",backgroundColor: Colors.redAccent);
      return;
    }
    if(c.isEmpty){
      Get.snackbar("Empty Field", "Confirm Password empty",backgroundColor: Colors.redAccent);
      return;
    }
    if(p!=c){
      Get.snackbar("Mismatch", "Passwords doesn't match",backgroundColor: Colors.redAccent);
    }
    try {
      FirebaseFirestore.instance.collection("users").doc(emailtec.text).set({
        "email": emailtec.text,
        // "pass":passtec.text,
        "phone": phonetec.text
      })
      ;
      Get.snackbar('Success', 'User Data uploaded Succesfully');
    }
    catch(e){
      Get.snackbar("Error", e.toString());
    }
    }
}
