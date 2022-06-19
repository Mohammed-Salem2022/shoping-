



import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import '../servies/product_services.dart';
import '../utils/my_String.dart';


class ProductController extends GetxController{
  User? myid=FirebaseAuth.instance.currentUser;

  List mangerFavoriteList=[];
  var FavoriteList=[];
  GetStorage listGex=GetStorage();
  List favoriteList1=[];
  List favoriteListFOrIcon=[];
  bool? checkfavorite=false;
  //search list
  List searchList=[];

  TextEditingController searchTextcontroll=TextEditingController();


      Future<List> getproduct()async{
        //هذا جيب البيانات من api
     //        ترجع على شكل مصفوفه
       var respons= await http.get(Uri.parse(baseUrl));
       var Jsondata= jsonDecode(respons.body) ;
       return Jsondata;


     }

  


    removefavoriteFirebase(int idProduct){
        // هنا يتم حذف عنصر من القائمه عن طريق  اخذ id من list ==با العنصر الي بضغط عليه اذا كان نفس العنصر يتم حذفه
        favoriteListFOrIcon.removeWhere((element) => element['id']==idProduct);
        update();
    }

  SendFavoriteToFirebase(List listFirebase,)async {
    //here send data to firebase after take data from list
    int  index=listFirebase.length-1;

    DocumentReference     userRef= await FirebaseFirestore.instance.collection('FavoriteList1').doc(myid?.uid).collection('choseeFa').doc();
    userRef.set({
      'id':listFirebase[index]['id'],
      'title':listFirebase[index]['title'],
      'price':listFirebase[index]['price'],
      'image':listFirebase[index]['image'],
      'idDelete':userRef.id,

    }).then((value) => {
   Get.snackbar('تم اضافة', 'تم اضافه الى مفضلة',snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.blueAccent)
    });


       update();


  }

deletedatafromfirebase(int idFavorite)async{

     CollectionReference     userRef= FirebaseFirestore.instance.collection('FavoriteList1').
     doc(myid?.uid).collection('choseeFa');
        //هنا اذا كان id الموجود في database نفس id الي بضغط عليه هات لي البيانات ثم امسحه
            await userRef.where('id' ,  isEqualTo: idFavorite).get().then((value) {

                   value.docs.forEach((element) {


                  String  id1= element['idDelete'];

                    userRef.doc(id1).delete().then((value) {
                      Get.snackbar('تم ازالة', 'تم ازلة من مفضلة',

                          snackPosition: SnackPosition.BOTTOM,backgroundColor: Colors.blueAccent);

                    });
                   });

            } );
     update();
   }
       bool  getfavvoritebool(int index){

        return favoriteListFOrIcon.any((element) => element['id']==index);
         //هنا اي ايدي موجود في المصفوفه ==نفس ايدي الي بضغط عليه يرجع لي true

         }

   getfavoriteFirebase()async{
      //favoriteListFOrIcon هنا نجيب البيانات من فايربيس ثم نضيفها الى مصفوفه
     CollectionReference     userRef= FirebaseFirestore.instance.
     collection('FavoriteList1').doc(myid?.uid).collection('choseeFa');
     await    userRef.get().then((value) {

      value.docs.forEach((element) {

        favoriteListFOrIcon.add(   element);

      } );

          });

       update();

  }
   // search Text
   void addSearchToList(String searchNameAge) {
     searchNameAge = searchNameAge.toLowerCase();
     searchList=mangerFavoriteList.where((element) {
       return element['title'].toLowerCase().contains(searchNameAge);
     }).toList();
     update();
   }

  @override
  void onInit() async
  {
        //هنا نستدعيgetfavoriteFirebase  اول مايشتغل التطبيق عشان تحتفظ داحل المصفوفه
        mangerFavoriteList= await getproduct();
  getfavoriteFirebase();
    super.onInit();
  }

}
