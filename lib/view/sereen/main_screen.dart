

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/controller/card_controller.dart';
import 'package:shoping_f/controller/mainscreen_controller.dart';
import 'package:shoping_f/routes/routes.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:badges/badges.dart';
import '../../controller/product_controller.dart';

class MainScreen extends StatelessWidget{
   MainScreen({Key? key}) : super(key: key);
   final controller= Get.find<MainScreenController>();
   final controller2= Get.put(ProductController());
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Obx((){

      return Scaffold(appBar: AppBar(title: Text(controller.title[controller.currentIndex.value]),centerTitle: true,elevation: 0,
        backgroundColor: Get.isDarkMode?Colors.blueGrey:mainColor,
        actions: [

          GetBuilder<CardController>(
              init: CardController(),
              builder: (controllerCard){
            return  FutureBuilder<QuerySnapshot>(
                future:controllerCard.getAllDataFromFirebase() ,
                builder: (context, snapshot) {
                   return   Badge(
                     position: BadgePosition.topEnd(top: 0, end: 3),
                     animationDuration: Duration(milliseconds: 300),
                     animationType: BadgeAnimationType.slide,
                     badgeContent:  Text(
                       '${snapshot.data?.docs.length}',
                       style: TextStyle(color: Colors.white),
                     ),
                     child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
                       Get.toNamed(Namepages.CardScreen);
                     }),
                   );
                });

          }),


        ],
      ),
        backgroundColor: context.theme.backgroundColor,
        bottomNavigationBar: bottomnavigationbar(controller: controller),

          body: IndexedStack(
          index:  controller.currentIndex.value,
          children: controller.tabes
        ),
      );
    });

  }





}










// هنا مربع الي يظهر في الاسفل
class bottomnavigationbar extends StatelessWidget{
   bottomnavigationbar({Key? key, required this.controller}) : super(key: key);
   MainScreenController controller;
  // final controller1= Get.find<MainScreenController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BottomNavigationBar(
        backgroundColor: Get.isDarkMode?Colors.black:Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.currentIndex.value,
        onTap: (indext){
          controller.currentIndex.value=indext;
        },
        items: [
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.home,color: Colors.green),
              icon: Icon(Icons.home,color: Get.isDarkMode?Colors.white:Colors.black),label:'' ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.category,color: Colors.green),
              icon: Icon(Icons.category,color:Get.isDarkMode?Colors.white:Colors.black),label:'' ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite,color: Colors.green),
              icon: Icon(Icons.favorite,color: Get.isDarkMode?Colors.white:Colors.black),label:'' ),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.settings,color: Colors.green),
              icon: Icon(Icons.settings,color:Get.isDarkMode?Colors.white:Colors.black),label:'' ),

        ]);





  }



}