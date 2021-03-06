









import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shoping_f/controller/card_controller.dart';
import 'package:shoping_f/controller/catogry_controller.dart';
import 'package:shoping_f/controller/product_controller.dart';
import 'package:shoping_f/model/product_card.dart';
import 'package:shoping_f/utils/theme.dart';

import 'package:shoping_f/view/sereen/product_details_screen.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';


class CategoryWidget extends StatelessWidget{
  String kindgategory;
  CategoryWidget({Key? key,required this.kindgategory}) : super(key: key);
  final controller= Get.find<ProductController>();
  final controllerCategory= Get.find<CategoryController>();
  final controllerCard= Get.find<CardController>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build



    return Scaffold(
     backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(title: Text('$kindgategory'),elevation: 0,
      backgroundColor:    Get.isDarkMode? pinkClr: mainColor,
         centerTitle: true,
      ),

      body: Container(
        padding: EdgeInsets.only(top: 20),
        child:
      FutureBuilder(
          future:  controllerCategory.getKindGategroy(kindgategory),
          builder: (context, AsyncSnapshot snapshot) {

            if(snapshot.hasError){
              print(controllerCategory.getKindGategroy(kindgategory));
              return Text('No data');
            }

            else   if (snapshot.connectionState == ConnectionState.waiting) {

              return const Center(
                child: CircularProgressIndicator(
                    color: Colors.blue, strokeWidth: 2),
              );
            }
            else  if (!snapshot.hasData) {
              const Text(
                'Loading....',
                style: TextStyle(fontSize: 30),
              );
            }
            return GetBuilder<ProductController>(builder: (builder){
              return
                GridView.builder(

                    itemCount:  snapshot.data?.length,


                    gridDelegate:const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        mainAxisSpacing: 10,
                        childAspectRatio:6.5/8,
                        crossAxisSpacing: 10),
                    itemBuilder: (context,index){




                      return Padding(padding: EdgeInsets.only(left: 10 ,right: 15),
                        child:
                        Container(
                          decoration: BoxDecoration(
                              color:Get.isDarkMode? Colors.blueGrey: Colors.grey,
                              borderRadius: BorderRadius.circular(10)
                          ),


                          child: Column(

                              children: [
                                GetBuilder<ProductController>(
                                    init:ProductController() ,
                                    builder: (nn){
                                      return

                                        Row(
                                            mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                                            children: [
                                              IconButton(onPressed: ()async{
                                                //  true== getfavvoritebool ?????? ?????? ??????
                                                // ???????? ?????? ???????????? ???? ???????? list and firebase
                                                if(controller.getfavvoritebool(snapshot.data[index]['id'])==true){
//                                            ?????? ?????? ?????? ?????? ???????? ???? ???????? ????????????????
                                                  controller.removefavoriteFirebase(snapshot.data[index]['id']);
                                                  //  ?????? ?????? ?????? ?????? ???????? ???? ???????? ??????????????
                                                  controller.deletedatafromfirebase(snapshot.data[index]['id']);


                                                }
                                                //?????? ?????? ?????? ''emement = emenmet ?????? ???????? ?????????? ???????? ???? ?????? list
                                                else {controller.favoriteListFOrIcon.add(
                                                    snapshot.data.firstWhere((element) => element['id']==snapshot.data[index]['id']));
                                                controller.SendFavoriteToFirebase(controller.favoriteListFOrIcon);





                                                }


                                                //?????? ?????? ?????? ???????????? ?????? ???????? ???????? ?????????? ???? ???????????? ???????? true
                                              },icon:controller.getfavvoritebool(snapshot.data[index]['id'])? Icon(Icons.favorite)
                                                  : Icon(Icons.favorite_border),

                                              ),
                                              IconButton(onPressed: () async{
                                                if(await controllerCard.readdataFromFirebase( snapshot.data[index]['id'])!=  snapshot.data[index]['id']) {
                                                  productCard p = productCard(
                                                      snapshot.data[index]['id'],
                                                      //count
                                                      1,
                                                      snapshot.data[index]['title'],
                                                      snapshot.data[index]['price'],
                                                      snapshot.data[index]['idDelete'],
                                                      snapshot.data[index]['image']);
                                                  controllerCard.addCardToFirebbase(p);
                                                } else {

                                                  controllerCard.defaultDailoge();

                                                }

                                              }, icon: Icon(Icons.shopping_cart)),
                                            ]);
                                    }),


                                InkWell(child: Container(
                                  width: double.infinity,
                                  height: 140,
                                  alignment: Alignment.center,
                                  color:Get.isDarkMode? Colors.white54: Colors.grey,

                                  child: Image.network('${snapshot.data[index]['image']}',
                                    fit: BoxFit.cover,width: double.infinity,),

                                ),
                                  onTap: (){

                                    List? delails=[];
                                    delails.add(snapshot.data[index]);

                                    Get.to(()=> ProductDelailsScreen(prodectmodle: delails));
                                  },
                                ),
                                Padding(padding: EdgeInsets.only(left: 10,right: 10),
                                  child:  Row(
                                      mainAxisAlignment:MainAxisAlignment.spaceBetween ,
                                      children: [
                                        TextUtils(text: '${snapshot.data[index]['price']}',
                                            fontWeight: FontWeight.bold, color: Get.isDarkMode?Colors.white:Colors.black, fontsize: 18),
                                        Container(
                                          padding: EdgeInsets.only(left: 5,right: 5),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                                            color: Colors.blue,


                                          ),
                                          child: Row(children: [
                                            TextUtils(text: '${snapshot.data[index]['rating']['rate']}',
                                                fontWeight: FontWeight.bold, color: Colors.white, fontsize: 18),
                                            Icon(Icons.star,size: 18,color: Get.isDarkMode?Colors.white:Colors.black),
                                          ]),
                                        )
                                      ]),

                                )
                              ]),
                        ),


                      );





                    });

            });

          }),



      ),



    );





  }



}