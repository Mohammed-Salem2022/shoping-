


import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../controller/auth_controller.dart';
import '../../../utils/theme.dart';
import '../../widgets/text_Utils.dart';

 class LogoutWidget extends StatelessWidget {
   final controller=Get.find<AuthController>();
   @override
   Widget build(BuildContext context) {
     return Row(children: [
       Container(
         padding: EdgeInsets.all(6),


         decoration: BoxDecoration(
             shape: BoxShape.circle,
             color:Get.isDarkMode? Color(0xff6132e4):mainColor

         ),
         child: Icon(Icons.exit_to_app_outlined),
       ),
       SizedBox(width: MediaQuery.of(context).size.width*0.05,),
      InkWell(
          splashColor:Get.isDarkMode? pinkClr: mainColor,
          customBorder: StadiumBorder(),
          child: TextUtils(
          text: 'Logo Out'.tr,
          fontWeight: FontWeight.bold,
          color: Get.isDarkMode?Colors.white:Colors.black ,
          fontsize: 25) ,
          onTap: (){
            controller.signOutFromApp();

      },
      )

     ],);

   }
 }
