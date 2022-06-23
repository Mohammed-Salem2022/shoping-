



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/utils/theme.dart';

import '../text_Utils.dart';
class TotalPriceandButton extends StatefulWidget {
  @override
  _TotalPriceandButtonState createState() => _TotalPriceandButtonState();
}

class _TotalPriceandButtonState extends State<TotalPriceandButton> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
     Center(
       child:   TextUtils(
        text: 'Total \$200',
        fontWeight: FontWeight.bold,
        color: Get.isDarkMode?Colors.white:Colors.black,
        fontsize: 20),
    ),
        ElevatedButton(
            onPressed: (){},
           style: ElevatedButton.styleFrom(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(10)
             ),
             primary:Get.isDarkMode?pinkClr:mainColor,


           ),
            child: TextUtils(
                text: 'Pay Now',
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontsize: 22),
        
        )
        
        
      ],
      
    );
  }
}

