




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/model/product_models.dart';

import '../widgets/product_Delails/cloths_info.dart';
import '../widgets/product_Delails/image_Slider.dart';

class ProductDelailsScreen extends StatelessWidget {
  ProductDelailsScreen({Key? key,required this.prodectmodle}) : super(key: key);
  List? prodectmodle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  context.theme.backgroundColor,

      body:SafeArea(child:  SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ImageSlider(imageUrl: prodectmodle?[0]['image']),
            ClothsInfo(title: prodectmodle?[0]['title'],
                listfavorite: prodectmodle!,
               id: prodectmodle?[0]['id'] ,
            ),
          ],
        ),),)
    );
  }
}
