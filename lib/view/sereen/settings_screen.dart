




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/controller/auth_controller.dart';
import 'package:shoping_f/controller/them_controller.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:shoping_f/view/sereen/setting/dark_mode_widget.dart';
import 'package:shoping_f/view/sereen/setting/logout_widget.dart';
import 'package:shoping_f/view/sereen/setting/profile_Widget.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';

class SettingsScreen extends StatelessWidget{
   SettingsScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    double sizeHeight= MediaQuery.of(context).size.height;
    // TODO: implement build
    return  Scaffold(
    backgroundColor: context.theme.backgroundColor,
     body: Padding(padding: EdgeInsets.all(20),
       child:ListView(children: [
         SizedBox(height:sizeHeight*0.02 ,),
          ProfileWidget(),
         SizedBox(height:sizeHeight*0.02 ,),
          Divider(
         thickness: 3,
         color:Get.isDarkMode? Colors.white:Colors.black,
         ),
         SizedBox(height:sizeHeight*0.02 ,),
         TextUtils(text: 'GENERAL', fontWeight: FontWeight.bold,
             color:Get.isDarkMode? pinkClr:mainColor, fontsize: 25),
         SizedBox(height:sizeHeight*0.05 ,),
         DarkModeWidget(),
       //  SizedBox(height:sizeHeight*0.03 ,),
        // LanguageWidget()
         SizedBox(height:sizeHeight*0.03 ,),
         LogoutWidget(),
         ]) ,
     ),

    );
  }




}