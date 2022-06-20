import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';



class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(

      children: [
      Container(
        height: 100,
        width: 100,
        decoration: const BoxDecoration(

          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage('https://images.unsplash.com/photo-1648737966316-864c713a8356?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'
              ,),
         fit: BoxFit.cover ),
        ),
      ),
      SizedBox(width: 15,),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        TextUtils(
            text: 'Mohammed Sailm',
            fontWeight: FontWeight.bold,
            color:Get.isDarkMode?Colors.white: Colors.black,
            fontsize: 25),
        TextUtils(
            text: 'Mohammed@gmail.com',
            fontWeight: FontWeight.bold,
            color:Get.isDarkMode?Colors.white: Colors.black,
            fontsize: 15),
      ],)
    ],);
  }
}
