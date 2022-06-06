
import 'package:http/http.dart' as http;
import 'package:shoping_f/utils/my_String.dart';

import '../model/product_models.dart';
class ProductSerivers{

static Future< List<Prodectmodle>>   getproduct()async{
     var respons= await http.get(Uri.parse(baseUrl));
     var Jsondata= respons.body;
     return prodectmodleFromJson(Jsondata);


   }


}