

import 'dart:convert';
class FaceBookModle {
   String ?name;
   String? email;
   String? id;
   FacebookPhotoModel ? facebookphotomodel;
   FaceBookModle({this.name, this.email, this.id, this.facebookphotomodel});
   factory  FaceBookModle.fromJson(Map<String,dynamic>fb)=>
       FaceBookModle(name: fb['name'],
      id: fb['id'],email: fb['email'],
         facebookphotomodel:FacebookPhotoModel.fromJson(fb['picture']['data'])
      );
}
class FacebookPhotoModel{
  final String ?Url;
  final int? height;
  final int ?width;
  FacebookPhotoModel({this.Url, this.height, this.width});
  factory FacebookPhotoModel.fromJson(Map<String,dynamic>json){
    return FacebookPhotoModel(height: json['height'],Url: json['url'],width: json['width']);
  }
}