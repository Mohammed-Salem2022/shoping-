


import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utils/my_String.dart';
class CategoryController extends GetxController{


  List<String>CategoryImage=[
    "https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg",
    "https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg",

  ];






  Future<List> getcategroy()async{
    //هذا جيب البيانات catogry من api
    // https://fakestoreapi.com/products/categories
    //        ترجع على شكل مصفوفه
    var respons= await http.get(Uri.parse(catogry));
    var Jsondata= jsonDecode(respons.body) ;
    return Jsondata;
  }


  Future<List> getKindGategroy(String kindgategroy)async{
    //هذا جيب البيانات catogry من api
    // https://fakestoreapi.com/products/categories
    //        ترجع على شكل مصفوفه
    var respons= await http.get(Uri.parse('https://fakestoreapi.com/products/category/$kindgategroy'));
    var Jsondata= jsonDecode(respons.body) ;
    return Jsondata;


  }



  @override
  void onInit() async{
    // TODO: implement onInit

    super.onInit();
  }
}