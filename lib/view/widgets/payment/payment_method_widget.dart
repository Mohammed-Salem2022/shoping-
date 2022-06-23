


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';
class PaymentMethodWidget extends StatefulWidget {
  @override
  _PaymentMethodWidgetState createState() => _PaymentMethodWidgetState();
}

class _PaymentMethodWidgetState extends State<PaymentMethodWidget> {
   int indexradio=1;
  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        BuildKIindpayment(
          value: 1,

          name: 'Paypal',
          image: 'images/paypal.png',
          scale: 0.7,
          onchanged: (value){
            setState(() {
              indexradio=value;
            });
          } ,


        ),
        SizedBox(
          height: 15,

        ),
        BuildKIindpayment(
          value:2,

          name: 'Google',
          image: 'images/google.png',
          scale: 0.7,
          onchanged: (value){
            setState(() {
              indexradio=value;
            });
          } ,


        ),
        const SizedBox(
          height: 15,

        ),
        BuildKIindpayment(
          value: 3,

          name: 'credit',
          image: 'images/credit.png',
          scale: 0.7,
          onchanged: (value){
            setState(() {
              indexradio=value;
            });
          } ,


        ),

      ],


    );
  }

  Widget BuildKIindpayment({
  required String image,
  required String name,
  required double scale,
  required Function onchanged,
    required int value,
}){

    return Container(
     // padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 70,

      color: Colors.grey.shade300,
      child: Padding(padding: EdgeInsets.all(15),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(image,scale:  scale,),
              SizedBox(width: 10,),
              TextUtils(
                  text: name,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontsize: 20),
            ],


          ),
          Radio(
              value:value ,
              fillColor: MaterialStateColor.resolveWith((states) => Colors.blue),
              groupValue:  indexradio ,
              onChanged: (value){
                onchanged(value);
              })
        ],
      ) ,
      ),


    );
  }
}
