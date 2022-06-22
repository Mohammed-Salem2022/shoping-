

   import 'package:flutter/material.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';

import '../../utils/theme.dart';
import 'package:get/get.dart';

import '../widgets/payment/delivery_container_widget.dart';

  class PaymentScreen extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar:AppBar(title:
        Text('PayMent'),centerTitle:true,
          backgroundColor: Get.isDarkMode?darkGreyClr:mainColor,
          elevation: 0,

        ),

      body: SingleChildScrollView(
        child:  Padding(padding: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           TextUtils(
               text: 'Shipping to',
               fontWeight: FontWeight.bold,
               color: Get.isDarkMode?Colors.white:Colors.black,
               fontsize: 25),
          const SizedBox(height: 20,),
           DeliveryContainerWidget(),
          const SizedBox(height: 20,),
          TextUtils(
              text: 'PayMent  method',
              fontWeight: FontWeight.bold,
              color: Get.isDarkMode?Colors.white:Colors.black,
              fontsize: 25),
          const SizedBox(height: 20,),
          // PaymentMethodWidget
          const SizedBox(height: 30,),
          //totalButton
        ]),
        ),
      )
      );
    }
  }

