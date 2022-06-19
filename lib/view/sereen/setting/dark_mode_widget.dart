import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/controller/setting_controller.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';

import '../../../controller/them_controller.dart';


class DarkModeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        init: SettingController(),
        builder: (controller){
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          bukidIconWidget(context),
          Switch(
            activeColor: Get.isDarkMode?pinkClr:mainColor,
              activeTrackColor: Get.isDarkMode?pinkClr:mainColor,
              value:controller.darkSwich ,
              onChanged: (value){
                ThemeDarkController().ChangeThemedark();
                controller.darkSwich=value;
              })
        ],);
    });
  }
}

Widget bukidIconWidget( context){

  return Row(children: [
    Container(
      padding: EdgeInsets.all(6),
      height: 50,
      
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color:Get.isDarkMode? Color(0xff6132e4):mainColor

      ),
      child: Icon(Icons.dark_mode),
    ),
    SizedBox(width: MediaQuery.of(context).size.width*0.05,),
    TextUtils(
        text: 'DarkMode',
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode?Colors.white:Colors.black ,
        fontsize: 25),

  ],);


}
