

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product_card.dart';
import '../model/product_models.dart';

 class CardController extends   GetxController{
   User? myid=FirebaseAuth.instance.currentUser;
  Map buyCardMap={};



  addCardToList(productCard productcard)async{






  }
    //1
   addCardToFirebbase( productCard p)async{
     //send data to firebase
     DocumentReference     userRef= await FirebaseFirestore.instance.collection('AddToCard').doc(myid?.uid).collection('Buy').doc();
     userRef.set({

       'id':p.id,
       'title':p.title,
       'count':p.count,
       'price':p.price,
       'image':p.image,
       'idDelete':userRef.id,

     }).then((value) => {
       Get.snackbar('تم اضافة', 'تم اضافه الى الى الشراء',snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.blueAccent)
     });


     update();

   }
  Future<int?>  readdataFromFirebase(int index)async{
    //DocumentReference
    //CollectionReference
    int? isDelete1;
     CollectionReference     userRef= FirebaseFirestore.instance.collection('AddToCard').
     doc(myid?.uid).collection('Buy');

     await userRef.where('id' ,isEqualTo:  index).get().then((value) {

        value.docs.forEach((element) {
          isDelete1=  element['id'];
       });

     });
  return isDelete1;
   }


    defaultDailoge(){
      Get.defaultDialog(title: '!! رسالة تنبية',

        titleStyle: TextStyle(color: Colors.red),
        middleText: 'منتج موجود سابقا',
        middleTextStyle: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
        cancel: MaterialButton(onPressed: (){Get.back();},

            child: const Text('Ok',style: TextStyle(color: Colors.blue,fontSize: 20,fontWeight: FontWeight.bold),)),

      );

    }

   @override
  void onInit() {
    // TODO: implement onInit

    super.onInit();
  }



 }