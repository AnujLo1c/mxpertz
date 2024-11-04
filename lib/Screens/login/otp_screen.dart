import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Gap(100),
            Align(
              alignment: AlignmentDirectional.topStart,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: IconButton.styleFrom(
                      backgroundColor:
                          Get.theme.colorScheme.primary.withOpacity(0.2)),
                  icon: Icon(Icons.chevron_left,
                      color: Get.theme.colorScheme.primary)),
            ),
            Gap(20),
            Text(
              "OTP Verification",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Gap(5),
            Text(
              "Enter the verification code we just sent on your \nemail address.",
              style: TextStyle(fontSize: 14, color: Colors.black45),
              textAlign: TextAlign.center,
            ),
            Gap(40),
            OtpTextField(
              enabledBorderColor: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
              numberOfFields: 4,
              fieldHeight: 50,
              fieldWidth: 50,
              focusedBorderColor: Colors.grey.shade300,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              borderColor: Colors.grey,
              showFieldAsBox: true,
              onCodeChanged: (String code) {},
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              },
            ),
            Gap(40),
            ElevatedButton(
              onPressed: () {
                Get.toNamed('/home');
              },
              child: Text(
                "VERIFY",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(Get.width - 50, 60)),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
