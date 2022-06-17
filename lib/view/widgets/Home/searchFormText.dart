



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/product_controller.dart';

class SearchFormText extends StatelessWidget{
   SearchFormText({Key? key}) : super(key: key);
 final controller=Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  GetBuilder<ProductController>(
        builder: (contorller){

      return TextField(
        controller:  controller.searchTextcontroll,
          onChanged: (searchNameAge){
            controller.addSearchToList(searchNameAge);

          },
          decoration:  InputDecoration(

            errorStyle: TextStyle(color: Get.isDarkMode  ? Colors.red:Colors.white ,fontWeight: FontWeight.bold),
            hintText: 'Search ',
            fillColor: Colors.grey.shade200,
            filled: true,

            hintStyle: TextStyle(fontSize: 20,color:Get.isDarkMode  ? Colors.black:Colors.black ,fontWeight: FontWeight.normal),
            prefixIcon: Icon(Icons.search,color:Colors.black),
            suffixIcon: InkWell(
              onTap: (){controller.searchTextcontroll.clear();
              controller.searchList.clear();
              controller.update();
              },
            child: Icon(Icons.close,color: Colors.black),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red,
                    style: BorderStyle.solid
                )
            ),
          )
      );
    });
  }




}