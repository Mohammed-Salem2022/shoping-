


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';

class ButtonSIGNUP extends GetWidget{
  Function() onPressed;
  String? TextButton;
   ButtonSIGNUP({Key? key,required this.onPressed,required this.TextButton}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: double.infinity,

        decoration: BoxDecoration(
            color: Get.isDarkMode ? pinkClr:mainColor,

            borderRadius: BorderRadius.circular(10)),
        child:   MaterialButton(onPressed:onPressed,

    child: TextUtils(color: Colors.white,fontWeight: FontWeight.bold,fontsize: 20,
    text: TextButton),

    ));
  }



}