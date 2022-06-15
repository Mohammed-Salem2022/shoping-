

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:get/get.dart';
import 'package:shoping_f/utils/theme.dart';
class TextDescription  extends StatelessWidget {
  TextDescription({Key? key,required this.Description}) : super(key: key);
  String Description;
  @override
  Widget build(BuildContext context) {
    return   ReadMoreText(
      Description,
      trimLines: 3,
      textAlign: TextAlign.justify,

      trimCollapsedText: 'Show More',
      trimExpandedText: ' Show less ',
      lessStyle:  TextStyle(
          color:  Get.isDarkMode?pinkClr: mainColor,
          fontWeight: FontWeight.bold
      ),
      moreStyle: TextStyle(
          color:  Get.isDarkMode?pinkClr: mainColor,
          fontWeight: FontWeight.bold
      ),
      style:  TextStyle(
          fontSize: 20,
          color:  Get.isDarkMode?Colors.white:Colors.black,
          height: 1,
          fontWeight: FontWeight.bold
      ),
    );

  }
}
