import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';

class TextFaild extends StatelessWidget{

   final  TextEditingController? controller1;
   final  bool obscureText1;
   final  TextInputType textInputType;
   final  Function validator;
   final  Widget? suffixIcon;
   final  Widget prefixIcon;
   final  Widget label;
   final  int maxLength;
   TextFaild({Key? key,required this.controller1,
     required this.obscureText1,
     required this.textInputType,
     required this.validator,
     required this.prefixIcon,
     required this.suffixIcon,
     required this.label,
     required this.maxLength,

   })

       : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return     TextFormField(
      controller: controller1,

      validator: (value)=> validator(value),
      obscureText:obscureText1 ,
      cursorColor: darkGreyClr,
      keyboardType: textInputType,
      maxLength: maxLength,
      style: TextStyle(color: Colors.black ),
    decoration:  InputDecoration(
        errorStyle: TextStyle(color: Get.isDarkMode  ? Colors.red:Colors.white ,fontWeight: FontWeight.bold),
    label: label,
    fillColor: Colors.grey.shade200,
    filled: true,
    labelStyle: TextStyle(fontSize: 20,color:Get.isDarkMode  ? Colors.black:Colors.blue ,fontWeight: FontWeight.bold),
    prefixIcon: prefixIcon,
    suffixIcon: suffixIcon,

    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.red)
    )

    ),

    );
  }




}
// validator: (text){
// name1=text;
// if(text!.isEmpty){
// return 'لايجب ان يكون النص فارغ';
// }
//
// },