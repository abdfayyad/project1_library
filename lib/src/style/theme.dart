import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';




ThemeData darkTheme=ThemeData(
    primarySwatch: Colors.deepOrange,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: HexColor('333739'),

    appBarTheme: AppBarTheme(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: HexColor('333739'),
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: HexColor('333739'),
        elevation: 1.0,
        iconTheme: IconThemeData(color: Colors.white),
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      elevation: 20.0,
      backgroundColor: HexColor('333739'),
      unselectedItemColor: Colors.grey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19.0,
            color: Colors.white),
        bodyText2: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            color: Colors.white)),
    cardColor: Colors.black26
);
ThemeData lightTheme=ThemeData(
  primarySwatch: Colors.deepOrange,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Colors.white,
        elevation: 1.0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontWeight: FontWeight.bold)),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      elevation: 20.0,
      backgroundColor: Colors.white,
      unselectedItemColor: Colors.grey,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.deepOrange),
    textTheme: TextTheme(
        bodyText1: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 19.0,
            color: Colors.black),
        bodyText2: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w500,
            color: Colors.black)),
    cardColor: Colors.white
);