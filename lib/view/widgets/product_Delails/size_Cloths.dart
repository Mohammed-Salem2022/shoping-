



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 import 'package:get/get.dart';

import '../../../utils/theme.dart';
class SizeCloths extends StatefulWidget {

  @override
  _SizeClothsState createState() => _SizeClothsState();
}

class _SizeClothsState extends State<SizeCloths> {
  List  sizecloths=['M','S','L',"XL","XXL"];
  int currentCloths=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:  Alignment.center,
      margin: EdgeInsets.all(15),
           height: 40,



        child:  ListView.separated(
          scrollDirection: Axis.horizontal,
        itemCount: sizecloths.length,
        itemBuilder: (context,index){

          return  InkWell(onTap: (){
            setState(() {
              currentCloths=index;
            });

          },

          child: Container(
            width: 50,
            alignment:  Alignment.center,
            decoration: BoxDecoration(
                color:Get.isDarkMode? currentCloths==index?
                pinkClr:Colors.black.withOpacity(1)
                    : currentCloths==index?  mainColor:Colors.white,
                border: Border.all(
                    color:Colors.grey

                ),
                borderRadius: BorderRadius.circular(15)

            ),
            child: Text(sizecloths[index],
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color:Get.isDarkMode? Colors.white:Colors.black
                )
            ),
          )
            ,
          );


        },
        separatorBuilder: (context,index)=> SizedBox(width: 10),
      ),
    );
  }
}
