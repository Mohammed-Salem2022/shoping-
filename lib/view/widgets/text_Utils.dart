



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class TextUtils extends StatelessWidget{
// هذا عباره عن text
  String?  text;
  double ? fontsize;
  Color?   color;
  FontWeight?fontWeight;
   TextUtils({Key? key,required this.text,required this.fontWeight,required this.color,required this.fontsize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Text(text!,
      style: TextStyle(fontSize:fontsize,
      color: color,
        fontWeight: fontWeight,
      ),



    );
  }




}