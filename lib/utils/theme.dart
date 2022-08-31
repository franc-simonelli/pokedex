// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/constants/color.dart';

class MyTheme {


  static List<BoxShadow> shadowText = [
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: Offset(1,1),
      color: Colors.black
    )
  ];

  static List<BoxShadow> shadowCardLight = [
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: Offset(1,1),
      color: Colors.grey.shade300
    )
  ];

  static List<BoxShadow> shadowCardDark = [
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: Offset(1,1),
      color: Colors.black
    )
  ];

  static List<BoxShadow> shadowTextType = [
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: Offset(-1, -1),
      color: Colors.black
    ),
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: Offset(-1, 1),
      color: Colors.black
    ),
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: Offset(1, -1),
      color: Colors.black
    ),
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: Offset(1, 1),
      color: Colors.black
    )
  ];

  static List<BoxShadow> shadowCardType = [
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: Offset(-1, -1),
      color: Colors.grey.shade600
    ),
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: Offset(1, 1),
      color: Colors.black
    )
  ];

  static List<BoxShadow> shadowButtonDrawerDark = [
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: Offset(-1,-1),
      color: Colors.grey.shade800
    ),
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: Offset(1,1),
      color: Colors.black
    )
  ];

  static List<BoxShadow> shadowButtonDrawerLight = [
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: Offset(-1,-1),
      color: Colors.white
    ),
    BoxShadow(
      blurRadius: 1,
      spreadRadius: 1,
      offset: Offset(1,1),
      color: Colors.grey.shade400
    )
  ];

  static ThemeData lightTheme = ThemeData(
    backgroundColor: AppColors.lightGrey,
    scaffoldBackgroundColor: AppColors.lightGrey,
    primaryColor: AppColors.lightGrey,
    splashColor: Colors.grey.shade900,
    textTheme: TextTheme(
      headline1: GoogleFonts.kanit(color: Colors.grey.shade800, fontSize: 28, fontWeight: FontWeight.bold),
      labelMedium: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, )),
      subtitle1: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.white, fontSize: 16, )),
      subtitle2: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.grey.shade900, fontSize: 16, )),
      bodyText1: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 15, )),
      bodyText2: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.grey.shade600, fontSize: 15, )),
      headline2: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.grey.shade800, fontSize: 20, fontWeight: FontWeight.bold)),
    
    )
  );

  static ThemeData darkTheme = ThemeData(
    backgroundColor: Colors.grey.shade900,
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.grey.shade900,
    splashColor: AppColors.lightGrey,

    textTheme: TextTheme(
      headline1: GoogleFonts.kanit(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
      labelMedium: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, )),
      subtitle1: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.white, fontSize: 16, )),
      subtitle2: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.white, fontSize: 16, )),
      bodyText1: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.white, fontSize: 15, )),
      bodyText2: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.grey.shade500, fontSize: 15, )),
      headline2: GoogleFonts.josefinSans(textStyle: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
      
    )
  );

}