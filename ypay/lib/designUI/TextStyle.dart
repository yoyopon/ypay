import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStylePage{

  static TextStyle getStyle(Locale _locale,String textColor,String text,String price){
    TextStyle fontStyle=TextStyle(
      fontFamily: _locale==Locale('mm')?"myanmar3":"Roboto Slab Regular",
      color:textColor=="white"?Colors.white:
        (textColor=="black"?Colors.black:textColor=="grey"?Colors.grey:
        (textColor=="red")?Colors.red:Color(0xff4AB055)),
      fontSize: text=="header"?ScreenUtil().setSp(60,allowFontScalingSelf: true):
        (text=="bottomtab"?ScreenUtil().setSp(25,allowFontScalingSelf: true):
        (text=="price"?ScreenUtil().setSp(80,allowFontScalingSelf: true):
        ScreenUtil().setSp(36,allowFontScalingSelf: true))),
      fontWeight: text=="header"?FontWeight.bold:FontWeight.normal,
      decoration: price=="oldPrice"?TextDecoration.lineThrough:TextDecoration.none,
    );
    return fontStyle;
  }
}