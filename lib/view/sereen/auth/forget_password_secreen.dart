


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_f/controller/auth_controller.dart';
import 'package:shoping_f/view/widgets/auth/text_faild.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';

import '../../../utils/my_String.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/button_sign_up.dart';
//If you want recover your account,then pls provide your email ID bleow..
class ForgetPassword extends StatelessWidget{
   ForgetPassword({Key? key}) : super(key: key);
  TextEditingController emailController= TextEditingController();
  final keyform=GlobalKey<FormState>();
   final controller=Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Get.isDarkMode?Colors.white:Colors.white30,
      appBar: AppBar(backgroundColor: Get.isDarkMode?Colors.white:Colors.white30,
      title: Text('ForgetPassword',style: TextStyle(color:Get.isDarkMode? Colors.red:Colors.white)),
      ),
      body:SingleChildScrollView(child:
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
            child:  Form(
                key: keyform,
                child:  Column(children: [
              //text
             Text('إذا كنت تريد استرداد حسابك ، فيرجى تقديم معرف البريد الإلكتروني الخاص بك ..',
              textAlign: TextAlign.center,
              style:TextStyle( fontWeight: FontWeight.normal, color: Get.isDarkMode?Colors.black:Colors.white, fontSize: 20)),
              SizedBox(height: 5,),
              //image
              Image.asset('images/forgetpass copy.png',width: 300,height: 300),
              //
               TextFaild(controller1:emailController,obscureText1: false,textInputType: TextInputType.emailAddress,
               validator: ( value){


                 if(value.toString().isEmpty  ){
                   return 'ادخل الايميل';
                 }
                 if(!RegExp(validationEmail).hasMatch(value)){
                   return 'ادخل الايميل بطريقه صحيحة';
                 }

               },
               prefixIcon: Icon(Icons.email,color:Get.isDarkMode ? mainColor:kColor5,),
               suffixIcon:Text('') ,
               label:Text('ادخل الايميل') ,
               maxLength:30 ,
             ),
                 ButtonSIGNUP(TextButton: 'SEND',onPressed: (){

                   if(keyform.currentState!.validate()){
                     controller.resetPassword(email: emailController.text.trim());
                   }
                 }),

        ])) )
        ,),




    );
  }




}