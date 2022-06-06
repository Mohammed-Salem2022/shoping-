

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';

import '../../../main.dart';
import '../../../utils/theme.dart';
import '../../../utils/theme.dart';

class UnderContainer extends GetWidget{
  String account;

  Function() ontab;
  UnderContainer({Key? key,required this.account,required this.ontab}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(width: double.infinity,
      height:MediaQuery.of(context).size.height*0.10,
    decoration:  BoxDecoration(
        color:  Get.isDarkMode ? pinkClr:mainColor,
        borderRadius:const BorderRadius.only(topRight:Radius.circular(10),
    topLeft: Radius.circular(10),
    )),
      child: InkWell(
          onTap:ontab ,
          child:Center(child:   TextUtils(color:Colors.white,fontsize: 20,fontWeight: FontWeight.bold,
        text:account ,))),
    );
  }
  
  
}