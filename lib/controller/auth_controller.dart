



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shoping_f/model/facebook_modle.dart';
import 'package:shoping_f/routes/routes.dart';

class AuthController extends GetxController{
  bool isVisitablity= false;
  bool isCheckBox= true;
  bool isloading= false;
  String? displayName;
  String? displayUserphoto;
  FirebaseAuth firebaseAuth=FirebaseAuth.instance;
  GoogleSignIn userGoogle= GoogleSignIn();
  FaceBookModle?faceBookModle;
  bool checkSignUp=false;
  GetStorage checksigninBox=GetStorage();
  void Loading(){
    isloading=!isloading;


    update();
  }


  void Visitablity(){
    isVisitablity = !isVisitablity;

    update();
  }

  void Checkbox(){
    isCheckBox = !isCheckBox;

     update();
  }

  void signUpUsingFirbaseEmail(  {

    required String name ,
    required String email1 ,
    required  String password1,

  } )async{


    try {
     await firebaseAuth.createUserWithEmailAndPassword(
          email: email1,
          password: password1,
      ).then((value) {
         Get.offNamed(Namepages.MainScreen);
         firebaseAuth.currentUser?.updateDisplayName(name);
         checkSignUp=true;
         checksigninBox.write('auth', checkSignUp);
         update();
     });
    } on FirebaseAuthException catch (e) {
      String title=e.code.replaceAll(RegExp('-'), ' ');
      String confirm;
      if (e.code == 'weak-password') {

        confirm='The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {

        confirm='The account already exists for that email..';
      } else{
        confirm=e.message.toString();
      }
      Get.defaultDialog(title: title,

        titleStyle: TextStyle(color: Colors.red),
        middleText: confirm,
        cancel: MaterialButton(onPressed: (){Get.back();},

          child: Text('Ok',style: TextStyle(color: Colors.blue,fontSize: 20),)),

      );
    } catch (e) {
      Get.defaultDialog(title: 'Error!',
        middleText: e.toString(),
        cancel: MaterialButton(onPressed: (){Get.back();},
          child: Text('Ok')),

      );
    }
    
    
  }
  void LoinInUsingFirbase({
    //هذا اذا قدك مسجل من قبل عملت فقط تسجيل خروج
  required String email,
  required String password,

})async{

    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
      ).then((value) {
        Get.offNamed(Namepages.MainScreen);
      });
    } on FirebaseAuthException catch (e) {
       String title1=e.code.replaceAll(RegExp('-'), ' ');
       String message='';
      if (e.code == 'user-not-found') {
       message='No user found for that email.';
      } else if (e.code == 'wrong-password') {
        message='Wrong password provided for that user.';
      }else{
        message=e.message.toString();
      }
      Get.defaultDialog(title: title1,

        titleStyle: TextStyle(color: Colors.red),
        middleText: message,
        cancel: MaterialButton(onPressed: (){Get.back();},

            child: Text('Ok',style: TextStyle(color: Colors.blue,fontSize: 20),)),

      );
    }catch(e){

      Get.defaultDialog(title: 'Erroe!',

        titleStyle: TextStyle(color: Colors.red),
        middleText: e.toString(),
        cancel: MaterialButton(onPressed: (){Get.back();},

            child: Text('Ok',style: TextStyle(color: Colors.blue,fontSize: 20),)),

      );

    }

  }
  void googleSinUpApp()async{

    try{
      final GoogleSignInAccount? googleUser = await userGoogle.signIn();
      displayName=googleUser?.displayName;
      displayUserphoto=googleUser?.photoUrl;

      isloading=false;
      checkSignUp=true;
      checksigninBox.write('auth', checkSignUp);
      update();
      Get.offNamed(Namepages.MainScreen);

    }
    catch(e){
      Get.defaultDialog(title: 'Error',

        titleStyle: TextStyle(color: Colors.red),
        middleText: e.toString(),
        cancel: MaterialButton(onPressed: (){Get.back();},

            child: Text('Ok',style: TextStyle(color: Colors.blue,fontSize: 20),)),

      );

    }

  }
  void resetPassword({
  required String email,
})async{
    try {
      await firebaseAuth.sendPasswordResetEmail(
        email: email,

      ).then((value) {
     
        Get.defaultDialog(title: 'تم ارسال ارساله الى الايميل!',

          titleStyle: TextStyle(color: Colors.red),
          middleText: 'راجع ايميلك راجع قسم الرسائل غير المرغوب فيها في ايميلك',
          cancel: MaterialButton(onPressed: (){Get.offNamed(Namepages.LoginScreen1);;},

              child: Text('Ok',style: TextStyle(color: Colors.blue,fontSize: 20),)),

        );

      });
      update();
    } on FirebaseAuthException catch (e) {
      String title1=e.code.replaceAll(RegExp('-'), ' ');
      String message='';
      if (e.code == 'user-not-found') {
        message='No user found for that email.';
      }else{
        message=e.message.toString();
      }
      Get.defaultDialog(title: title1,

        titleStyle: TextStyle(color: Colors.red),
        middleText: message,
        cancel: MaterialButton(onPressed: (){Get.back();},

            child: Text('Ok',style: TextStyle(color: Colors.blue,fontSize: 20),)),

      );
    }catch(e){

      Get.defaultDialog(title: 'Erroe!',

        titleStyle: TextStyle(color: Colors.red),
        middleText: e.toString(),
        cancel: MaterialButton(onPressed: (){Get.back();},

            child: Text('Ok',style: TextStyle(color: Colors.blue,fontSize: 20),)),

      );

    }



  }
  void signOutFromApp(){
    Get.defaultDialog(title: 'تسجيل الخروج من التطبيق',

      titleStyle: TextStyle(color: Colors.red),
      middleText: 'هل أنت متأكد أنك تريد تسجيل الخروج',
      confirm: MaterialButton(onPressed: (){
        FacebookAuth.i.logOut();
        userGoogle.signOut();
        firebaseAuth.signOut();
        displayUserphoto="";
        displayName='';
        checksigninBox.remove('auth');
        update();
        Get.offNamed(Namepages.WelcomeScreen);

      },

          child: Text('Ok',style: TextStyle(color: Colors.blue,fontSize: 20),)),
      cancel: MaterialButton(onPressed: (){Get.back();},

          child: Text('No',style: TextStyle(color: Colors.blue,fontSize: 20),)),

    );



  }

 void FacebookLogin()async{
    // 526704512467257
   final LoginResult loginResult = await FacebookAuth.instance.login();
   if(loginResult.status==LoginStatus.success){

     final data=await FacebookAuth.instance.getUserData();

     faceBookModle= FaceBookModle.fromJson(data);
     checkSignUp=true;
     checksigninBox.write('auth', checkSignUp);
     update();
     Get.offNamed(Namepages.MainScreen);
   }

 }
}