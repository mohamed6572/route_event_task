import 'package:flutter/material.dart';
abstract class AppConstans {
  static Color get  mainColor => Color(0xff004182);
  static Color get  textColor => Color(0xff06004F);


  static  TextStyle titleStyle =  TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: textColor);
  static  TextStyle priceStyle =  TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: textColor);
  static  TextStyle reviewStyle =  TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: textColor);
  static  TextStyle hintStyle =  TextStyle(fontSize: 14,fontWeight: FontWeight.w400,color: textColor.withOpacity(0.6));
  static  TextStyle DisPriceStyle =  TextStyle(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      color:textColor.withOpacity(0.6),
      decoration: TextDecoration.lineThrough);
}