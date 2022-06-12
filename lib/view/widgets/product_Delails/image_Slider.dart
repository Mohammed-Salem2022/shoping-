



import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoping_f/utils/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class ImageSlider extends StatefulWidget {
  String imageUrl;
  ImageSlider({Key? key,required this.imageUrl}) : super(key: key);
  @override
  ImageSliderState createState() => ImageSliderState();
}

class ImageSliderState extends State<ImageSlider> {


 //
  int currentpage=0;
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
            autoPlayInterval: Duration(seconds: 2),
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

            ,)
    ],);
  }
}

