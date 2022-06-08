


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:shoping_f/view/widgets/cardWidget/card_Total.dart';

import '../../../controller/card_controller.dart';

import '../../widgets/cardWidget/cardProductCard.dart';




class CardScreen extends StatelessWidget{
   CardScreen({Key? key}) : super(key: key);
  final controller = Get.find<CardController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //هنا نشتري نبيع في card item
    return Scaffold(
        backgroundColor: context.theme.backgroundColor, 
        appBar:AppBar(title:
               Text('Card Item'),centerTitle:true,
                backgroundColor: Get.isDarkMode?darkGreyClr:mainColor,
          elevation: 0,
          actions: [IconButton(onPressed: (){}, icon: Icon(Icons.backspace))],
    ),
      body:SingleChildScrollView(child:


        Column(children: [
          SizedBox(
          height: MediaQuery.of(context).size.height*0.75,
          child:

              GetBuilder<CardController>(builder: (b){

                return  StreamBuilder<QuerySnapshot>(
                    stream:  controller.getAllDataFromFirebase().asStream(),
                    builder: (context, snapshot) {
                      if(snapshot.hasError){

                        return Center(child:  Text('No data try again',style: TextStyle(fontSize: 20),));
                      }
                      else if(snapshot.connectionState==ConnectionState.waiting){

                        return const Center(
                          child: CircularProgressIndicator(
                              color: Colors.blue, strokeWidth: 2),
                        );

                      }



                      return      ListView.separated(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context,index){


                          return CardProductCard(image:snapshot.data?.docs[index]['image'] ,
                            isDelete: snapshot.data?.docs[index]['idDelete'],
                            totalprice: snapshot.data?.docs[index]['totalprice'],
                            title: snapshot.data?.docs[index]['title'] ,
                            count: snapshot.data?.docs[index]['count'] ,
                            price:  snapshot.data?.docs[index]['price'] ,
                          );


                        },
                        separatorBuilder: (context,index) {
                          return SizedBox(height: 20,);

                        } ,
                      );




                    });
              })

            ),
          CardTotal(),
        ],),
        ),
        );







  }




}