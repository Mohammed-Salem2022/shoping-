






import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoping_f/controller/card_controller.dart';
import 'package:shoping_f/routes/routes.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'colorsPicker.dart';


class ImageSlider extends StatefulWidget {
  String imageUrl;

  ImageSlider({Key? key,required this.imageUrl}) : super(key: key);
  @override
  ImageSliderState createState() => ImageSliderState();
}

class ImageSliderState extends State<ImageSlider> {
  List<Color> Colorselected=[
    kColor1,
    kColor2,
    kColor3,
    kColor4,
    kColor5,
    kColor2,
    kColor3,
    kColor4,

  ];

 //
  int currentpage=0;
  int currentColors=0;
  CarouselController carouselController= CarouselController();
  @override

  Widget build(BuildContext context) {
    return Stack(children: [
      CarouselSlider.builder(
          itemCount: 3,
          carouselController: carouselController,
          options:CarouselOptions(
            height: MediaQuery.of(context).size.height*0.50,
              autoPlay: true,
               enlargeCenterPage: true,
            enableInfiniteScroll: false,
            viewportFraction: 2,
            autoPlayInterval: Duration(seconds:3),
            onPageChanged: (index,reason){

               setState(() {
                currentpage= index;
               });

            }

          ),

          itemBuilder:(context,index,realindex){
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),


              ),
              child: ClipRRect(child: Image.network(widget.imageUrl),
              borderRadius: BorderRadius.circular(25),
              ),
              );
          },

           ),

          Positioned(
            bottom: MediaQuery.of(context).size.width*0.05,
            left: MediaQuery.of(context).size.height*0.28,
            child:  AnimatedSmoothIndicator(
              activeIndex: currentpage,
              count:3 ,
          effect:  ExpandingDotsEffect(dotHeight: 10,dotWidth: 10,
          activeDotColor: Get.isDarkMode?pinkClr:mainColor

          ),
          )

            ,),
         Positioned(


           //هنا تصميم اختيار الالوان
             bottom: MediaQuery.of(context).size.height*0.03,
             left: MediaQuery.of(context).size.width*0.80,
             child: Container(
               height: MediaQuery.of(context).size.height*0.25,
               width: MediaQuery.of(context).size.width*0.07,
             decoration: BoxDecoration(
             color: Colors.black.withOpacity(0.4),
             borderRadius: BorderRadius.circular(15)
           ),
              child: ListView.separated(
                itemBuilder:  (context,index){
                  return GestureDetector(
                    onTap: (){
                            setState(() {
                              currentColors=index;
                            });

                    },
                    child: ColorPicker(
                      color:Colorselected[index] ,
                      outerBorder: currentColors==index ,),
                  );
                },
                separatorBuilder: (context,index)=> SizedBox(height: 5),
                itemCount: Colorselected.length)
         )),
      desginHeadPage(),
    ],);
  }
}






Widget desginHeadPage()  {
final contrller= Get.find<CardController>();

// here desgin Head Page
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
     InkWell(
       onTap: (){
           Get.back();

       },
       child:     Container(
           margin:EdgeInsets.all(20) ,

           decoration: BoxDecoration(
             color: Get.isDarkMode?pinkClr:mainColor,

             shape: BoxShape.circle,
           ),
           child:  const Icon(Icons.arrow_back,
             size: 30,
             color:Colors.white,)
       )
     ),
      InkWell(onTap: (){

          Get.offNamed(Namepages.CardScreen);
      },
         child:FutureBuilder<QuerySnapshot>(
             future:contrller.getAllDataFromFirebase() ,
             builder: (context,snapshot){
               return       Badge(
                 position: BadgePosition.topEnd(top: 10, end: 13),
                 animationDuration: Duration(milliseconds: 300),
                 animationType: BadgeAnimationType.slide,
                 badgeContent:  Text(
                   '${snapshot.data?.docs.length}',
                   style: TextStyle(color: Colors.white),
                 ),
                 child: Container(
                     margin:EdgeInsets.all(20) ,
                     padding:EdgeInsets.all(8)  ,

                     decoration: BoxDecoration(
                       color: Get.isDarkMode?pinkClr:mainColor,

                       shape: BoxShape.circle,
                     ),
                     child:  const Icon(Icons.shopping_cart,
                       size: 20,
                       color:Colors.white,)
                 ),
               );
             }),









      ),
    ],);

}
