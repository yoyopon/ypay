import 'package:flutter/material.dart';

class UserInfo{
  String name;
  String email;
  String imageUrl;
  String msg;
  String loginWith;

  UserInfo({this.name,this.email,this.imageUrl,this.msg,this.loginWith});

  // FbData _fbData;
  // FbData get fbData{
  //   if(_fbData==null){
  //     _fbData=FbData();
  //   }
  //   return fbData;
  // }

  static UserInfo userInfo;
  static Locale currentLocale;
  static String prev;
}