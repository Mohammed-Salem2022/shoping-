




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_String.dart';
import '../../../utils/theme.dart';
import '../../widgets/auth/button_sign_up.dart';
import '../../widgets/auth/chaeck_accept.dart';
import '../../widgets/auth/text_faild.dart';
import '../../widgets/auth/underContainer.dart';
import '../../widgets/text_Utils.dart';

class LoginScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    TextEditingController emailController= TextEditingController();
    TextEditingController passwordController= TextEditingController();
    GlobalKey<FormState>formstate=new GlobalKey();
    final controller= Get.find<AuthController>();
    return Scaffold(appBar: AppBar(elevation: 0,
        backgroundColor: Get.isDarkMode ? Colors.white10:Colors.white),
        backgroundColor: Get.isDarkMode ? Colors.white10:Colors.white,
    body:SingleChildScrollView(

    child:Column(children: [Padding(padding: EdgeInsets.symmetric(vertical: 40 ,horizontal: 30),
    child:Form(
    key: formstate,
    child:   Column(

    children:  [
    Row(
    children: [
    // SIGN Up
    TextUtils(text: 'SIGN', fontWeight: FontWeight.w500, color:
    Get.isDarkMode ? mainColor:pinkClr, fontsize: 30),
    SizedBox(width: 5,),
    TextUtils(text: 'IN', fontWeight: FontWeight.w500, color:
    Colors.red, fontsize: 35)],),
    SizedBox(height: 30,),


    //2- email
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
    ),  SizedBox(height: 15,),

     GetBuilder<AuthController>(builder: (builder){

       return
       controller.isloading?const CircularProgressIndicator(
       color: Colors.blue,
         strokeWidth: 4,
       ):Container();



     }),



    //3-password
    GetBuilder<AuthController>(
    builder: (_){
    return TextFaild(controller1:passwordController,obscureText1:controller.isVisitablity?false:true,textInputType: TextInputType.emailAddress,
    validator: (value){
    if(value.isEmpty){
    return 'ادخل الباسبورد';
    }
    if(value.toString().length<6){
    return 'لابد ايكون رقم السري اكثر من 6';
    }
    },
    prefixIcon: Icon(Icons.lock,color: Get.isDarkMode ? mainColor:kColor5,),
    suffixIcon: IconButton(onPressed: (){
    controller.Visitablity();

    },
    icon: controller.isVisitablity?
    Get.isDarkMode ? Icon(Icons.visibility_off,): Icon(Icons.visibility_off,color: Colors.black)
        :Icon(Icons.visibility,)

    ),
    label:Text('رقم السري') ,
    maxLength:30 ,
    );
    }),


    //ForgetPassword
    Align(
    alignment: Alignment.centerRight,
    child:TextButton(onPressed: (){Get.toNamed(Namepages.ForgetPassword);},
      child: TextUtils(text: 'ForgetPassword', fontWeight: FontWeight.normal, color:Get.isDarkMode?Colors.black:Colors.white, fontsize: 20)), ),
    SizedBox(height: 15,),


    //4-  terms conditions
    CheckAccepetcondition(),
    SizedBox(height: 15,),
    //4- Button
    ButtonSIGNUP(onPressed: (){

    if(formstate.currentState!.validate()) {
        controller.LoinInUsingFirbase(email: emailController.text.trim(),
            password: passwordController.text.trim());
    }


    },
        TextButton: 'LOG IN'
    ),
      SizedBox(height: 15,),
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
         InkWell(child: Image.asset('images/facebook.png'),
         onTap:(){
                 controller.FacebookLogin();

         } ,

         ),
         SizedBox(width: 30,),
         InkWell(child: Image.asset('images/google.png'),
         onTap: (){
            controller.Loading();
           controller.googleSinUpApp();
         },
         ),
       ],)

    ],

    )),
    ),
    SizedBox(height: 10,),
    //4- bottomcontainer
    UnderContainer(ontab:(){
    Get.offNamed(Namepages.SignUpScreen);

    },account: 'Already have an Acount?  SIGN UP '),

    ],


    ),
    )
    );
  }



}