





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/routes/routes.dart';
import 'package:shoping_f/utils/theme.dart';

class CardItems extends StatelessWidget{
  const CardItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //هنا تصيميم card متى يكون فاضي
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child:  Icon(Icons.shopping_cart_rounded,size: 150,) ),
        SizedBox(height: MediaQuery.of(context).size.height*0.05),
        RichText(text: TextSpan(children: [
          TextSpan(text: 'Your Card is ',style: TextStyle(color: Get.isDarkMode?Colors.white:Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
          TextSpan(text: 'Empty',style: TextStyle(color: Get.isDarkMode?pinkClr:mainColor,fontSize: 25,fontWeight: FontWeight.bold)),

        ])),
        SizedBox(height: MediaQuery.of(context).size.height*0.03),
        Container(
            decoration: BoxDecoration(color: Get.isDarkMode?pinkClr:Colors.blue,
            borderRadius: BorderRadius.circular(15),
            ),
            child: MaterialButton(onPressed: (){Get.offNamed(Namepages.MainScreen);},
              child: Text('Back',style:TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold) ),)),

    ],);
  }




}