

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/controller/catogry_controller.dart';

import 'categroy_widget.dart';

class CategroyItems extends StatelessWidget {
  final controller= Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child:
        // GetBuilder<CategoryController>(
        // init: CategoryController(),
        // builder: (controller){

      // return
      StreamBuilder(
          stream:  controller.getcategroy().asStream(),
          builder: (context,AsyncSnapshot snapshot){
            if(snapshot.hasError){
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
        return ListView.separated(
            itemBuilder: (context, index) {
              return Stack(children: [
                Container(
                    width:double.infinity,
                    height: MediaQuery.of(context).size.height*0.20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20)
                    ),
                    child:InkWell(child: ClipRRect(child: Image.network(controller.CategoryImage[index],
                      fit: BoxFit.cover,),
                      borderRadius: BorderRadius.circular(20),

                    ),
                      onTap: (){
                       Get.to(()=> CategoryWidget(kindgategory:snapshot.data[index] ,));

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

                        child: Text('${snapshot.data[index]
                        }',style:TextStyle(
                          color: Get.isDarkMode?Colors.black.withOpacity(1):Colors.white.withOpacity(1),
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
            itemCount: snapshot.data.length);
      })
  //  })
    );


    


  }
}
