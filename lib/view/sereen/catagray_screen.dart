import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';

import '../widgets/categroy_widget/categroy_item.dart';
class CategroyScreen extends StatelessWidget{
  const CategroyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor:context.theme.backgroundColor ,
      body: Padding(padding: EdgeInsets.all(20),
       child: Column(
         children: [
           Align(
             alignment: Alignment.topLeft,
             child: TextUtils(text: 'Categroy',
                 color:Get.isDarkMode? Colors.white: Colors.black,
                 fontWeight: FontWeight.bold,
                 fontsize: 30),
           ),
           SizedBox(height: 10,),
           CategroyItems(),

         ],

       ),
      ),
    );
  }




}