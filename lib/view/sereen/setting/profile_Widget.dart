import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';

import '../../../controller/auth_controller.dart';

// final contollerAuth= Get.put(AuthController());

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
        init: AuthController(),
        builder: (controller){

          return Row(

            children: [
              Container(
                height: 100,
                width: 100,
                decoration:   BoxDecoration(

                  shape: BoxShape.circle,
                  image:controller.imageUser() !=null? DecorationImage(
                      image: NetworkImage(controller.imageUser()!
                        ,),
                      fit: BoxFit.cover ,): const DecorationImage(
                    image: AssetImage('images/user.png'),
                    fit: BoxFit.cover ,)
                ),
              ),
              SizedBox(width: 15,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 TextUtils(
               text:    controller.nameUser(),
               fontWeight: FontWeight.bold,
               color:Get.isDarkMode?Colors.white: Colors.black,
                fontsize: 25),

                  TextUtils(
                      text:controller.emailUser(), //contollerAuth.displayEmail,
                      fontWeight: FontWeight.bold,
                      color:Get.isDarkMode?Colors.white: Colors.black,
                      fontsize: 15),
                ],)
            ],);

        });
  }
}
