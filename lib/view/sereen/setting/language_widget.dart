




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shoping_f/controller/setting_controller.dart';

import '../../../utils/my_String.dart';
import '../../../utils/theme.dart';
import '../../widgets/text_Utils.dart';

class LanguageWidget extends StatefulWidget {
  @override
  _LanguageWidgetState createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
        init: SettingController(),
        builder: (controller){
      return  Row(

        children: [
          Material(

              color: Colors.transparent,

              child:Row(

                children: [
                  Container(
                    padding: EdgeInsets.all(7) ,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.redAccent

                    ),
                    child: const Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                  )


                ],)
          ),
          SizedBox(width: MediaQuery.of(context).size.width*0.05,),

          InkWell(
            splashColor:Get.isDarkMode? pinkClr: mainColor,
            customBorder: StadiumBorder(),
            child: TextUtils(
                text: 'language'.tr,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode?Colors.white:Colors.black ,
                fontsize: 25) ,
            onTap: (){



            },
          ),
         SizedBox(width: 55),

           Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
             children: [

             Container(
               width: 150,

               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(15),
                 border: Border.all(
                     color: Get.isDarkMode? Colors.white:Colors.black,
                     width: 2
                 ),



               ),
               child: DropdownButtonHideUnderline(
                   child:DropdownButton<String>(

                       iconSize: 25,
                       icon:  Icon(
                         Icons.arrow_drop_down,
                         color: Get.isDarkMode? Colors.white:Colors.black,
                       ),
                       items:  [
                         DropdownMenuItem(
                           child:Container(padding: const EdgeInsets.all(10),
                             child: Text(arabic,
                               style: const TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 20
                               ),
                             ),
                           ),
                           value: ara,

                         ),
                         DropdownMenuItem(
                           child:Container(padding: const EdgeInsets.all(10),
                             child: Text(english,
                               style: const TextStyle(
                                   fontWeight: FontWeight.bold,
                                   fontSize: 20
                               ),
                             ),
                           ),
                           value: ene,
                         ),
                       ],
                       value: controller.langLocal,
                       onChanged: (value){
                         controller.changelanguage(value!);
                         Get.updateLocale(Locale(value));
                       })
               ),
             ),

           ],)


        ],
      );

    });
  }
}
