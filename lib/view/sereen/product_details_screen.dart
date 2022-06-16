




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:shoping_f/model/product_models.dart';

import '../widgets/product_Delails/addToCard.dart';
import '../widgets/product_Delails/cloths_info.dart';
import '../widgets/product_Delails/image_Slider.dart';
import '../widgets/product_Delails/size_Cloths.dart';
import '../widgets/product_Delails/textDescrption.dart';

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
            const SizedBox(height: 10,

              ),
          Padding(padding: EdgeInsets.all(10),
           child:  TextDescription(Description: prodectmodle?[0]['description'],),
            ),
            SizedBox(height: 15,),
            SizeCloths(),
            AddToCard(price:  prodectmodle?[0]['price'],
            shopingCard: prodectmodle!,

            )


          ],
        ),
      ),
      )
    );
  }
}
