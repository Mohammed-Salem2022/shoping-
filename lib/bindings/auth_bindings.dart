

import 'package:get/get.dart';

import '../controller/auth_controller.dart';

class AuthBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
  }


}