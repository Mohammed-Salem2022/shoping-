import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/routes/routes.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   Size size= MediaQuery.of(context).size;
    return
            SafeArea(child: Scaffold(

             body: Stack(children: [
                 Image.asset('images/shopCloths.jpg',width: double.infinity,height: double.infinity,
                 fit: BoxFit.cover,
                 ),
                  Container(height: double.infinity,width: double.infinity,
                color: Colors.black.withOpacity(0.3),
                ),
                 Column(

                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height*0.18,),
                 Center(
                  child:    Container( width:MediaQuery.of(context).size.width*0.45,
                        height:60,
                        decoration:  BoxDecoration(color:Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(child:TextUtils(text: 'Welcome', fontWeight: FontWeight.bold, color: Colors.black, fontsize: 35))
                )
             ),
                    SizedBox(height:MediaQuery.of(context).size.height*0.03,),


                    Center(
                        child:Container(
                            width:MediaQuery.of(context).size.width*0.50,
                            height:60,
                            decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                             color: Colors.white.withOpacity(0.7)),
                            child:     Row(
                          
                             mainAxisAlignment: MainAxisAlignment.center,
                              children: [Center(child:TextUtils(text: 'Asroo ', fontWeight: FontWeight.bold, color: Colors.black, fontsize: 35)),
                               Center(child:TextUtils(text: 'Shop', fontWeight: FontWeight.bold, color: mainColor, fontsize: 35)),
                           ]
                            ))

                    ),
                     SizedBox(height: size.height*0.18,),
                     ElevatedButton(onPressed: (){Get.offNamed(Namepages.LoginScreen1);},
                      style: ElevatedButton.styleFrom(
                       primary: mainColor,
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )

                      ),
                      child:TextUtils(text: 'Get Start', fontWeight: FontWeight.bold, color:Colors.white, fontsize: 20) ),
                    SizedBox(height: 10,),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        TextUtils(text: 'Don,t have any an Acount?', fontWeight: FontWeight.bold, color:kColor2 , fontsize: 15),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap:(){Get.offNamed(Namepages.SignUpScreen);},
                          child:
                        TextUtils(text: 'Sgin Up', fontWeight: FontWeight.bold, color:kColor2 , fontsize: 18),)
                    ]),
              ]),
        ],)
      ));

  }
}
