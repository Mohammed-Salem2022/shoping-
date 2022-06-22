import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../utils/my_String.dart';

class SettingController extends GetxController{

  bool darkSwich= false;
  GetStorage  storage= GetStorage();
  String langLocal=ara;

  Future<String>  get readLanguage async{
    return  await storage.read('lang');
  }

  void saveLanguage(String lang)async{
  await  storage.write('lang', lang);
  }

  void changelanguage(String language){

   if(langLocal==language){
     return;
   }
   else if (language==ara){
      langLocal=ara;
      saveLanguage(langLocal);

   }
   else if (language==ene){
      langLocal=ene;
      saveLanguage(langLocal);

   }
    update();
  }

  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
       if(!storage.hasData('lang')){
        saveLanguage(langLocal);

       }

     langLocal=await readLanguage;

  }

}