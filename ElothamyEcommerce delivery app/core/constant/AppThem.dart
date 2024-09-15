import 'package:eltohamyecommercedeliveryapp/core/constant/mycolors.dart';
import 'package:flutter/material.dart';

class AppThem {

  static ThemeData themEnglish = ThemeData(
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: AppColor.secondarycolor ,

    ),

      cardTheme: CardTheme().copyWith(
        color:AppColor.white , 
        surfaceTintColor:  AppColor.white
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(color: AppColor.white , 
            fontFamily: 'PlayfairDisplay',

        fontSize: 23
        ),
                iconTheme: IconThemeData(
          color: AppColor.white

        ),
        backgroundColor: AppColor.secondarycolor , 
      ),
    fontFamily: 'PlayfairDisplay',
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.black),
      headline2: TextStyle(fontSize: 20, color: AppColor.grey, height: 2),
      headline3: TextStyle(fontSize: 25, color: AppColor.wightGrey),
      headline4: TextStyle(fontSize: 17, color: AppColor.wightGrey),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  ); 
  
   static ThemeData arabicThem = ThemeData(
    fontFamily: "Cairo",
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: AppColor.black),
      headline2: TextStyle(fontSize: 20, color: AppColor.grey, height: 2),
      headline3: TextStyle(fontSize: 25, color: AppColor.wightGrey),
      headline4: TextStyle(fontSize: 17, color: AppColor.wightGrey),
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );
}
