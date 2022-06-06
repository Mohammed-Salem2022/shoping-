




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/controller/auth_controller.dart';
import 'package:shoping_f/controller/them_controller.dart';

class SettingsScreen extends StatelessWidget{
   SettingsScreen({Key? key}) : super(key: key);
  final controller=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
    backgroundColor: context.theme.backgroundColor,

      body: Column(children: [  InkWell(
          onTap: (){
            ThemeDarkController().ChangeThemedark();
          },
          child: Center(child:  Text('ChangeMode',style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,)),)),
        InkWell(
          onTap: (){
            controller.signOutFromApp();
          },
          child: Center(child:  Text('SignOut',style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,)),)),


      ]
      )
    );
  }




}