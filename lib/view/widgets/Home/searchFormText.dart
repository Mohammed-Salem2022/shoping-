



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchFormText extends StatelessWidget{
  const SearchFormText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextFormField(
        decoration:  InputDecoration(
        errorStyle: TextStyle(color: Get.isDarkMode  ? Colors.red:Colors.white ,fontWeight: FontWeight.bold),
    hintText: 'Search ',
    fillColor: Colors.grey.shade200,
    filled: true,
    hintStyle: TextStyle(fontSize: 20,color:Get.isDarkMode  ? Colors.black:Colors.black ,fontWeight: FontWeight.normal),
    prefixIcon: Icon(Icons.search,color:Colors.black),
    suffixIcon: Icon(Icons.arrow_forward,color: Colors.black),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(color: Colors.red)
    ),
        )
    );
  }




}