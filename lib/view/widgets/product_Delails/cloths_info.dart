




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'package:get/get.dart';
import 'package:shoping_f/model/product_models.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';

import '../../../controller/product_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class ClothsInfo  extends StatelessWidget {
  ClothsInfo({Key? key,required this.title,
    required this.listfavorite,
    required this.id})
      : super(key: key);
  String title;
  List listfavorite;
  int id;
  final conroller= Get.find<ProductController>();

  @override

  Widget build(BuildContext context) {
    num ?rate=listfavorite[0]['rating']['rate'];
    return Padding(padding: EdgeInsets.all(20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
          Expanded(child:   Text('$title',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),
            overflow: TextOverflow.ellipsis,
          ),),
          Container(
            decoration:BoxDecoration(
                shape: BoxShape.circle,
                color: Get.isDarkMode? pinkClr:mainColor
            ),
            child: GetBuilder<ProductController>(builder: (_){

              return IconButton(onPressed: (){
                if(conroller.getfavvoritebool(listfavorite[0]['id'])==true){
//                                            هنا حتى يتم حذف عنصر من ادخل المصفوفه
                  conroller.removefavoriteFirebase(listfavorite[0]['id']);
                  //  هنا حتى يتم حذف عنصر من ادخل فايربيس
                  conroller.deletedatafromfirebase(listfavorite[0]['id']);


                }else {
                  conroller.favoriteListFOrIcon.addAll(listfavorite);
                  conroller.SendFavoriteToFirebase(listfavorite);
                  conroller.update();
                }


              },
                  icon: conroller.getfavvoritebool(id)? Icon(Icons.favorite, color:Get.isDarkMode?Colors.white:  Colors.red,)
                      :Icon(Icons.favorite_border));

            })
            )
        ],),
         Row(children: [
           TextUtils(text: '${listfavorite[0]['rating']['rate']}',
               fontWeight: FontWeight.bold,
               color: Get.isDarkMode?Colors.white :Colors.black,
               fontsize: 20),

            RatingBar.builder(

              initialRating: rate!.toDouble() ,
                minRating: 1,
                direction: Axis.horizontal,
               allowHalfRating: true,
                 itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                 Icons.star,
                 color: Colors.amber,
        ),
            onRatingUpdate: (rating) {

             },
      ),
         ],)
      ],

    ),
    );
  }
}
