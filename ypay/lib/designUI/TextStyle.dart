import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStylePage{

  static TextStyle getStyle(Locale _locale,String textColor,String text){
    TextStyle fontStyle=TextStyle(
      fontFamily: _locale==Locale('mm')?"myanmar3":"Roboto Slab Regular",
      color:textColor=="white"?Colors.white:(textColor=="black"?Colors.black:textColor=="grey"?Colors.grey:Color(0xff4AB055)),
      fontSize: text=="header"?ScreenUtil().setSp(60,allowFontScalingSelf: true):
        (text=="bottomtab"?ScreenUtil().setSp(30,allowFontScalingSelf: true):ScreenUtil().setSp(40,allowFontScalingSelf: true)),
      fontWeight: text=="header"?FontWeight.bold:FontWeight.normal
    );
    return fontStyle;
  }
}