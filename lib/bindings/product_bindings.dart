




import 'package:get/get.dart';
import 'package:shoping_f/controller/product_controller.dart';

class ProductBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductController());
      }



}