

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/utils/theme.dart';

import '../../widgets/cardWidget/CardsItem.dart';
import '../../widgets/cardWidget/cardProductCard.dart';




class CardScreen extends StatelessWidget{
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //هنا نشتري نبيع في card item
    return Scaffold(
        backgroundColor: context.theme.backgroundColor, 
        appBar:AppBar(title:
               Text('Card Item'),centerTitle:true,
                backgroundColor: Get.isDarkMode?darkGreyClr:mainColor,
          elevation: 0,
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.backspace))],
    ),
      body: ListView.separated(

          itemBuilder: (context,indext){

            return CardProductCard();
          },
          separatorBuilder: (context,index) {
            return SizedBox(height: 20,);

          } ,
          itemCount: 10)
    );
  }




}