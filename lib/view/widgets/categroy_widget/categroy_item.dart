

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'categroy_widget.dart';

class CategroyItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(child:  ListView.separated(
        itemBuilder: (context, index) {
          return Stack(children: [
            Container(
            width:double.infinity,
            height: MediaQuery.of(context).size.height*0.20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)
            ),
            child:InkWell(child: ClipRRect(child: Image.network('https://images.unsplash.com/photo-1638913659197-46040471de1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
              fit: BoxFit.cover,),
              borderRadius: BorderRadius.circular(20),

            ),
            onTap: (){
              Get.to(()=> CategoryWidget());
            },
            )
          ),
            Positioned(
                bottom: MediaQuery.of(context).size.height*0.020,
                left: MediaQuery.of(context).size.height*0.020,
                child:  Container(
                  padding: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      color: Get.isDarkMode?Colors.white.withOpacity(0.5):Colors.black.withOpacity(0.5)

                    ),

                 child: Text('Mohammed',style:TextStyle(
                   color: Get.isDarkMode?Colors.black.withOpacity(0.5):Colors.white.withOpacity(0.5),
                 fontSize: 20,
                 fontWeight:  FontWeight.bold,),

          )


            )


            ),
          ],);
        },
        separatorBuilder: (context,index){
          return SizedBox(height: 10,);
        },
        itemCount: 4));


    


  }
}
