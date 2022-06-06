import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:shoping_f/view/widgets/auth/underContainer.dart';
import 'package:shoping_f/view/widgets/text_Utils.dart';

import '../../../controller/auth_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/my_String.dart';
import '../../widgets/auth/button_sign_up.dart';
import '../../widgets/auth/chaeck_accept.dart';
import '../../widgets/auth/text_faild.dart';

class SignUpScreen extends StatelessWidget{
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
  TextEditingController passwordController= TextEditingController();
  GlobalKey<FormState>formstate=new GlobalKey();
   final controller= Get.find<AuthController>();
   String? nameuser;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Get.isDarkMode ? Colors.white:Colors.white30,
     appBar:  AppBar(elevation: 0,
         backgroundColor: Get.isDarkMode ? Colors.white:Colors.white30),
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
              TextUtils(text: 'Up', fontWeight: FontWeight.w500, color:
              darkGreyClr, fontsize: 35)],),
            SizedBox(height: 30,),

            //1-name
            TextFaild(controller1:nameController,obscureText1: false,textInputType: TextInputType.text,
            validator: ( value){

                 nameuser=value;
              if(value.toString().isEmpty  ){
                return 'ادخل اسمك';
              }
              if(!RegExp(validationName).hasMatch(value)){
                return 'ادخل اسمك من دون ارقام';
              }
              if(value.toString().length<=3){
                return 'لابد ان يكون اسمك اكثر من 3 حروف';
              }


            },
            prefixIcon: Icon(Icons.person,color:Get.isDarkMode ? mainColor:kColor5,),
            suffixIcon:Text('') ,
              label: Text('ادخل اسمك') ,
              maxLength: 10,
            ),    SizedBox(height: 15,),

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
                        :Icon(Icons.visibility,)//,: Icon(Icons.visibility_off,color: Colors.black)

                ),
                label:Text('رقم السري') ,
                maxLength:30 ,
              );
            }),


            SizedBox(height: 15,),


            //4-  terms conditions
            CheckAccepetcondition(),
            SizedBox(height: 15,),
            //4- Button
            ButtonSIGNUP(onPressed: () async {
                   if(controller.isCheckBox==true){
                     Get.defaultDialog(title: 'Check Box',

                       titleStyle: TextStyle(color: Colors.red),
                       middleText: 'Please Accept terms & conditions',
                       cancel: MaterialButton(onPressed: (){Get.back();},

                           child: Text('Ok',style: TextStyle(color: Colors.blue,fontSize: 20),)),

                     );

                   }
                     else if(formstate.currentState!.validate()) {

                      controller.signUpUsingFirbaseEmail(name: nameController.text,email1: emailController.text.trim(),
                          password1: passwordController.text.trim()) ;

                     }


            },TextButton: 'SIGN UP'),


        ],
        )),
          ),
          SizedBox(height: 15,),
          //4- bottomcontainer
          UnderContainer(ontab:(){
            Get.offNamed(Namepages.LoginScreen1);
            
          },account: 'Already have an Acount?  LIGN IN '),

        ],


        ),
        )
    );
  }



}