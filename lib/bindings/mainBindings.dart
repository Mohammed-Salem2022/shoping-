


import 'package:get/get.dart';
import 'package:shoping_f/controller/mainscreen_controller.dart';

class MainBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(MainScreenController());
  }



}