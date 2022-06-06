


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:get/get.dart';
class CardProductCard extends StatelessWidget {
  // هنا تصنيم card الي داحل cardscreen
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: 10,right: 10,left: 10),
    child: Container(
     padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
      color:Get.isDarkMode?Colors.grey: mainColor.withOpacity(0.7),
      borderRadius: BorderRadius.circular(15),


    ),
    child: Row(children: [
      Image.network('https://images.unsplash.com/photo-1629424565821-24e10082d7a1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
      fit: BoxFit.cover,
      height: MediaQuery.of(context).size.height*0.18,
        width:  MediaQuery.of(context).size.width*0.30,
      ),
     const SizedBox(width: 20,),
        Expanded(child:   Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
         Text('bla bla bla bal bla blala bla bla bal',
         overflow: TextOverflow.ellipsis,
         style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Get.isDarkMode?Colors.white: Colors.black),
         ),
          SizedBox(height: 20,),
          Text('\$15',
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Get.isDarkMode?Colors.white: Colors.black),
          ),

      ]),),
         Column(
      //     mainAxisAlignment: MainAxisAlignment.end,
           children: [
           Row(children: [
             IconButton(onPressed: (){}, icon: Icon(Icons.add_circle)),
             Text('1',
               overflow: TextOverflow.ellipsis,
               style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Get.isDarkMode?Colors.white: Colors.black),
             ),
             IconButton(onPressed: (){}, icon: Icon(Icons.remove_circle)),
           ],),
           IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,))
           ],)
         ],)
    ),
    );
  }
}
