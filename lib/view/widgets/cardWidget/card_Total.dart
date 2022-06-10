




import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../controller/card_controller.dart';
 class   CardTotal extends StatelessWidget {
   @override
   //Check Out
   final controller1=Get.find<CardController>();
   Widget build(BuildContext context) {
     return Container(
       padding: EdgeInsets.all(15),
       child: Row(children: [
         Column(children: [
           TextUtils(text: 'Total...', fontWeight: FontWeight.w600,
               color: Get.isDarkMode?Colors.white:Colors.black, fontsize: 18),
                   GetBuilder<CardController>(builder: (contro){
                     return  StreamBuilder<QuerySnapshot>(
                         stream: controller1.totalAllProduct().asStream(),
                         builder: (context,snapshot){
                           num p=0;
                           snapshot.data?.docs.forEach((element) {
                             p=p+element['totalprice'];
                           });

                           return   Text('\$${p.toStringAsFixed(2) }',style: TextStyle(fontWeight: FontWeight.bold, color:
                           Get.isDarkMode?Colors.white:Colors.black,fontSize: 20 ,height: 1),
                             overflow: TextOverflow.ellipsis,

                           );

                         });

                   })







         ]),
        SizedBox(width: MediaQuery.of(context).size.width*0.05,),
        Expanded(

            child:   SizedBox(
               
                child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                   primary: Get.isDarkMode?pinkClr:mainColor,
                   padding: EdgeInsets.all(20)
                ),
                onPressed: (){


                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
              TextUtils(text: 'Check Out', fontWeight: FontWeight.bold, color: Colors.white, fontsize: 20),
              Icon(Icons.shopping_cart_rounded)
            ],))))
       ],)
       
     );
   }
 }
 
 String text(){
   final controller1=Get.find<CardController>();
    return controller1.totalAllProduct().toString();
}