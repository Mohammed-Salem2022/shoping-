


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:get/get.dart';

import '../../../controller/card_controller.dart';
class CardProductCard extends StatelessWidget {
  CardProductCard({Key? key,required this.image,required this.isDelete ,required this.totalprice,
  required this.title ,required this.count,required this.price
  }) : super(key: key);
  String image;
  String ? isDelete;
  num  totalprice;
  String title;
  int count;
  num price;
  final countroller= Get.find<CardController>();
  // هنا تصنيم card الي داحل cardscreen
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 10,right: 10,left: 10),
    child: Container(
     padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
      color:Get.isDarkMode?Colors.grey: mainColor.withOpacity(0.7),
      borderRadius: BorderRadius.circular(15),


    ),
    child: Row(children: [
      Image.network(image,
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height*0.18,
        width:  MediaQuery.of(context).size.width*0.30,
      ),
     const SizedBox(width: 20,),
        Expanded(child:   Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
         Text(title,
         overflow: TextOverflow.ellipsis,
         style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Get.isDarkMode?Colors.white: Colors.black),
         ),
          SizedBox(height: 20,),
          Text(totalprice.toString(),
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Get.isDarkMode?Colors.white: Colors.black),
          ),

      ]),),
         Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
           children: [
           Row(children: [
             IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle)),
             GetBuilder<CardController>(builder: (b){

               return  Text(count.toString(),
                 overflow: TextOverflow.ellipsis,
                 style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Get.isDarkMode?Colors.white: Colors.black),
               );
               countroller.update();
             }),
             IconButton(onPressed: (){

                countroller.addcount(idDelete: isDelete!, totleprice: totalprice, count: count, price: price);
               //    countroller.update();
             }, icon: Icon(Icons.add_circle)),

           ],),
           IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,))
           ],)
         ],)
    ),
    );
  }
}
