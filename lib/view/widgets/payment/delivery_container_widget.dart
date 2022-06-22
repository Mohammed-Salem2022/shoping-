 import 'package:flutter/material.dart';
 import 'package:get/get.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';


 class DeliveryContainerWidget extends StatefulWidget {

   @override
   _DeliveryContainerWidgetState createState() => _DeliveryContainerWidgetState();
 }

 class _DeliveryContainerWidgetState extends State<DeliveryContainerWidget> {
     int radioCintainerIndex=1;
     bool changeColors=false;

   @override
   Widget build(BuildContext context) {
     return Column(
       children: [
        BulidRaidoContainer(
          adress: 'Yemen ,sana.a shmailh',
          title: 'shoping with Mohammed',
          name: 'Mohammed',
          phone: '55-66-77-22',
          color: changeColors? Colors.white:Colors.grey.shade300,
          value: 1,
          onchanged: (value){
            setState(() {
              radioCintainerIndex=value;
              changeColors=!changeColors;
            });
          }

        ),
         SizedBox(height: 10,),
         BulidRaidoContainer(
          adress: 'Yemen ',
          title: ' with Mohammed',
          name: 'Mohammed',
          phone: '55-665-775-222',
          color: changeColors? Colors.grey.shade300:Colors.white,
          value: 2,
          onchanged: (value){
            setState(() {
              radioCintainerIndex=value;
              changeColors=!changeColors;
            });
          }

        ),
       ],

     );
   }
     Widget BulidRaidoContainer({
       required Color color,
       required  int value,
       required Function onchanged,
       required String name,
       required String title,
       required String phone,
       required String adress,
     }){
       return Container(
         height:120 ,
         width:  double.infinity,
         decoration:  BoxDecoration(
             borderRadius: BorderRadius.circular(15),
             color: color,
             boxShadow: [
               BoxShadow(
                 color: Colors.grey.withOpacity(0.2),
                 spreadRadius: 3.0,
                 blurRadius: 3.0,
               )
             ]
         ),
         child: Row(
             crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Radio(
                   value: value,
                   groupValue: radioCintainerIndex,
                   fillColor: MaterialStateColor.resolveWith((states) => Colors.red),
                   onChanged: ( value){
                     onchanged(value);

                   }),
               SizedBox(width:10 ,),
               Padding(padding: EdgeInsets.only(top: 20),
                 child:  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     TextUtils(
                         text: name,
                         fontWeight: FontWeight.bold,
                         color: Colors.black,
                         fontsize: 22),
                     TextUtils(
                         text: title,
                         fontWeight: FontWeight.normal,
                         color: Colors.black,
                         fontsize: 20),
                     TextUtils(
                         text: phone,
                         fontWeight: FontWeight.normal,
                         color: Colors.black,
                         fontsize: 20),
                     TextUtils(
                         text: adress,
                         fontWeight: FontWeight.normal,
                         color: Colors.black,
                         fontsize: 20),
                   ],
                 )


               )
             ]),
       );
     }


 }

