


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:shoping_f/controller/auth_controller.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';

class CheckAccepetcondition extends StatelessWidget{
 //  final Function ontab;
   CheckAccepetcondition({Key? key}) : super(key: key);
  final controllerCheckBox=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<AuthController>(builder: (builder){
      return
        InkWell(
          onTap: (){
            controllerCheckBox.Checkbox();
          },
          child:  Row(children: [
            Container(

              decoration: BoxDecoration(
                  color: Get.isDarkMode? Colors.white:Colors.black54,
                  borderRadius: BorderRadius.circular(10)),
                  width: MediaQuery.of(context).size.width*0.09,
                  height: MediaQuery.of(context).size.height*0.05,
              child:
              controllerCheckBox.isCheckBox?Container():
            Icon(Icons.check, color: Get.isDarkMode ? Colors.white:pinkClr,
              size: 30,),),
            SizedBox(width: 10,),
            TextUtils(text: 'I accept ', fontWeight: FontWeight.w500, color:Get.isDarkMode?Colors.white :Colors.black, fontsize: 20),
            TextUtils(text: 'terms conditions', fontWeight: FontWeight.w500, color:Get.isDarkMode?Colors.white :Colors.black, fontsize: 20),

          ],),);
    });
  }
  
  
  
  
}