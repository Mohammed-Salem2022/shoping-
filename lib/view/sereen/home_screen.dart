




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';
import 'package:get/get.dart';

import '../widgets/Home/item_card.dart';
import '../widgets/Home/searchFormText.dart';

class Homescreen extends StatelessWidget{
  const Homescreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
      body: Column(

        children: [

        Container(
          //Find Your هنا مربع الي فوقه
          //وا مربع النص
          width: double.infinity,
          height: MediaQuery.of(context).size.height*0.25,
          decoration:  BoxDecoration(color: Get.isDarkMode?Colors.blueGrey: mainColor,
            borderRadius:BorderRadius.only(bottomLeft: Radius.circular(30),bottomRight: Radius.circular(30)) ,
          ),
          child: Padding(padding: EdgeInsets.only(left: 20,right: 20),
           child:    Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtils(text: 'Find Your', fontWeight: FontWeight.bold, color: Get.isDarkMode?Colors.white:Colors.white, fontsize: 25),
                  TextUtils(text: 'INSPIRATION', fontWeight: FontWeight.bold, color: Get.isDarkMode?Colors.white:Colors.white, fontsize: 25),
                  SizedBox(height:MediaQuery.of(context).size.height*0.03),
                  SearchFormText(),
                ]
         ),
          )
        ),
          SizedBox(height:MediaQuery.of(context).size.height*0.03),
       Padding(padding: EdgeInsets.only(right: 20,left: 20),
       child: Row(
         children: [TextUtils(text: 'Categories', fontWeight: FontWeight.bold,
             color: Get.isDarkMode?Colors.white:Colors.black, fontsize: 20 )],

       ),
       ),
          SizedBox(height:MediaQuery.of(context).size.height*0.03),
          ItemCard(),
      ],)
    );
  }




}