

import 'package:get/get.dart';
import 'package:shoping_f/view/sereen/catagray_screen.dart';
import 'package:shoping_f/view/sereen/favorties_screen.dart';
import 'package:shoping_f/view/sereen/home_screen.dart';
import 'package:shoping_f/view/sereen/settings_screen.dart';

class MainScreenController extends GetxController{
  RxInt currentIndex= 0.obs;

 final tabes=[
   Homescreen(),
   CategroyScreen(),
   FavortiesScreen(),
   SettingsScreen()
 ].obs;
 final title =[
   'Shoping',
   'Categroy',
   'favorties',
   'settings'


 ].obs;
}