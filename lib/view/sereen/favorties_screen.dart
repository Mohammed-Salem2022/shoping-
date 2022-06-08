





import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../controller/product_controller.dart';

class FavortiesScreen extends StatelessWidget{
   FavortiesScreen({Key? key}) : super(key: key);
   final conFav=Get.put<ProductController>(ProductController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //conFav.favoriteList1=

    return  Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(10),
         child: GetBuilder<ProductController>(
             init: ProductController(  ),
             builder: (controller){



               if(  controller.favoriteListFOrIcon.isEmpty){

                 return Column(children: [
                   Image.asset('images/heart.png'),
                   IconButton(onPressed: (){

                   }, icon: Icon(Icons.eleven_mp))
                 ],);

               }else {





                 return    ListView.separated(
               itemCount: controller.favoriteListFOrIcon.length,
               itemBuilder: (context,index){
                    // print(favoriteList.length);

                 return DesginFavortiesScreeen(

                   image:  controller.favoriteListFOrIcon[index]['image'],
                   title:  controller.favoriteListFOrIcon[index]['title'],
                   price:   controller.favoriteListFOrIcon[index]['price'],
                   remove:   controller.favoriteListFOrIcon[index]['id'],
                     controller: controller
                 );
               } ,
               separatorBuilder: (context,index){
                 return Divider(color:Get.isDarkMode? Colors.white:Colors.black,height: 10,thickness: 1,);
               },

             );
             }
         })


      )
    );
  }




}

Widget DesginFavortiesScreeen( {
  required String image,
  required String title,
  required num price,
  required int remove,
  required ProductController controller,
} ){

 // final controller = Get.find<ProductController>();

// هنا تصميم شاشة مفضلة
  return
    Row(
      
      children: [
      Container(
          height: 100,
          width:100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow:[ BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 5,
                color: Colors.black.withOpacity(0.3),
              )]
          ),
          child:ClipRRect(
            
            borderRadius: BorderRadius.circular(10),
            child:
            Image.network(image,
              fit: BoxFit.cover,
            ),
          ) //
      ),
      SizedBox(width: 10),
      Expanded(child:    Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:   [
          Text(title,
          style: TextStyle(overflow: TextOverflow.clip, color: Get.isDarkMode? Colors.white:Colors.black,fontWeight: FontWeight.w500),),
          SizedBox(height: 10),
          Text('\$$price',style: TextStyle(fontWeight: FontWeight.bold),),


      ],)
      ),
     IconButton(onPressed: (){

      controller.removefavoriteFirebase(remove);
      controller.deletedatafromfirebase(remove);


     }, icon: Icon(Icons.favorite,color: Colors.red,))
    ],);








}