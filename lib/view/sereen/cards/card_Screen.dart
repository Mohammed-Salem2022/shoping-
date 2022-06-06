

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/utils/theme.dart';

import '../../widgets/CardsItem.dart';




class CardScreen extends StatelessWidget{
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return Scaffold(
        backgroundColor: context.theme.backgroundColor, 
        appBar:AppBar(title:
               Text('Card utem'),centerTitle:true,
                backgroundColor: Get.isDarkMode?darkGreyClr:mainColor,
          elevation: 0,
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.backspace))],
    ),
      body: CardItems(),
    );
  }




}