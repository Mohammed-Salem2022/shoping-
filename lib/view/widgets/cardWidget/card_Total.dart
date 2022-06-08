






import 'package:flutter/cupertino.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
 class   CardTotal extends StatelessWidget {
   @override
   //Check Out
   Widget build(BuildContext context) {
     return Container(
       padding: EdgeInsets.all(15),
       child: Row(children: [
         Column(children: [
           TextUtils(text: 'Total...', fontWeight: FontWeight.w600, color: Get.isDarkMode?Colors.white:Colors.black, fontsize: 18),
           Text('\$200..',style: TextStyle(fontWeight: FontWeight.bold, color: Get.isDarkMode?Colors.white:Colors.black,fontSize: 20 ,height: 1)),


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
                onPressed: (){}, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
              TextUtils(text: 'Check Out', fontWeight: FontWeight.bold, color: Colors.white, fontsize: 20),
              Icon(Icons.shopping_cart_rounded)
            ],))))
       ],)
       
     );
   }
 }
 
