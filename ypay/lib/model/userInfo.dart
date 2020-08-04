import 'dart:io';
import 'package:flutter/material.dart';

class UserInfo{
  String name;
  String email;
  String imageUrl;
  String msg;
  String loginWith;
  String phone;

  UserInfo({this.name,this.email,this.imageUrl,this.msg,this.loginWith,this.phone});

  static String prevFormsgPage;
  static UserInfo userInfo;
  static Locale currentLocale;
  static File fileImage;
  static bool hideBottomBar=false;

  Map<String, dynamic> toMapForDb() {
  var map = Map<String, dynamic>();
  map['name'] = name;
  map['email'] = email;
  map['imageUrl'] = imageUrl;
  map['msg'] = msg;
  map['loginWith'] = loginWith;
  map['phone'] = phone;
  return map;
}

UserInfo.fromDb(Map<String, dynamic> map)
    : name = map['name'],
      email = map['email'],
      imageUrl = map['imageUrl'],
      msg = map['msg'],
      loginWith = map['loginWith'],
      phone = map['phone'];

}