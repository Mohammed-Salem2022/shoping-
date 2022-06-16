
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/controller/card_controller.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';
class AddToCard extends StatelessWidget {
  AddToCard({Key? key,required this.price,required this.shopingCard,}) : super(key: key);
   num? price;
   List shopingCard;
   final controller= Get.find<CardController>();
  @override
  Widget build(BuildContext context) {
    return  Container(
        padding:  EdgeInsets.all(15),
        child: Row(children: [
             Column(children: [
        TextUtils(
            text: 'price',
            fontWeight: FontWeight.bold,
            color:Get.isDarkMode?Colors.white: Colors.black,
            fontsize: 18),
        Text('\$$price',
          style: TextStyle(
              color:Get.isDarkMode?Colors.white: Colors.black,
              fontSize: 20,
            fontWeight:  FontWeight.bold

          ),)
      ],),
            SizedBox(width: 20,),
          Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height*0.10,
                decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Get.isDarkMode?pinkClr:mainColor,
                ),

                 child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                  MaterialButton(onPressed: ()async{
                    if(await controller.readdataFromFirebase( shopingCard[0]['id']  )!= shopingCard[0]['id'])
                      {
                        await   controller.addCardFromdetails(shopingCard);

                      }
                     else
                       controller.defaultDailoge();

                    
                  },
                  child:const Text('Add to Card',style:  TextStyle(fontSize: 20,color: Colors.white)),

                  ),
                   SizedBox(width: 10,),
                   const Icon(Icons.shopping_cart_rounded,size: 20,color: Colors.white),
                 ]),
                  ))
    ],));
  }
}
