


import 'package:flutter/cupertino.dart';

class ColorPicker extends StatelessWidget {
  ColorPicker({Key? key,required this.color,required this.outerBorder}) : super(key: key);
  Color color;
  bool outerBorder;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: outerBorder?Border.all(color: color,width:  2):null,

      ),
      child:Container(
       padding: EdgeInsets.all(15),
       decoration: BoxDecoration(
       shape: BoxShape.circle,
       color: color,


    ),
      )
    );
  }
}
