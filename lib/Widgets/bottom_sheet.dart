import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Future<Widget> showBottomSheet(title,description,VoidCallback next) async {
 return await Get.bottomSheet(
   barrierColor: Colors.transparent,
        Container(
          height: Get.height/2.7,
          padding: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(50),
              Text(title,style: TextStyle(
                color: Get.theme.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
                fontSize: 22
              ),),
              Gap(30)
,              Text(description,textAlign: TextAlign.center,),
              Spacer(),
              Row(
                children: [
                  Spacer(),
                  GestureDetector(
                    onTap: () {
Get.toNamed('/login');
                    },
                    child: Text("Skip>>",style: TextStyle(
                    color: Get.theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),),
                  ),
                  Gap(Get.width/4),
                  GestureDetector(
                    onTap: () => next(),
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage("assets/next.png"))
                      ),
                    ),
                  ),
                ],
              ),
                  Gap(30)
            ],
          ),
        )
    );
  }


