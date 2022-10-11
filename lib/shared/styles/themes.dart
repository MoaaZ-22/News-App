import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';


// Light Mode
ThemeData lightMode = ThemeData(
  textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
          color: Colors.black
      )),

  // ده لون ال دايره بتاعت ال Loading
  primarySwatch: Colors.deepOrange,
  // ده لون ال Scaffold
  scaffoldBackgroundColor: Colors.white,
  // دي كل الحاجات ال في appbar
  appBarTheme: const AppBarTheme(
      titleSpacing: 20.0,
      // ده لون الايقون ال في ال AppBar
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
      // ****************** ده بقي لون الخط ال بيبقي فيه الساعه والوايفاي ال هو بيبقي فوق appbar
      systemOverlayStyle:
      SystemUiOverlayStyle(
          statusBarColor: Colors.white,
          // ده لون الحاجات ال فيه
          statusBarIconBrightness: Brightness.dark
      ),
      backgroundColor: Colors.white,
      elevation:0.0,
      titleTextStyle: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.black)


  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData
    (
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      elevation: 20.0
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,

  ),
);

// Dark Mode
ThemeData darkMode = ThemeData(

  textTheme: const TextTheme(
      bodyText1: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18.0,
          color: Colors.white
      )
  ),
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: HexColor('242526'),
  appBarTheme: AppBarTheme(
      titleSpacing: 20.0,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      systemOverlayStyle:
      SystemUiOverlayStyle(
          statusBarColor: HexColor('242526'),
          statusBarIconBrightness: Brightness.light
      ),
      backgroundColor: HexColor('242526'),
      elevation:0.0,
      titleTextStyle: const TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white)


  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData
    (
      backgroundColor: HexColor('242526'),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.deepOrange,
      unselectedItemColor: Colors.grey,
      elevation: 20.0
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.deepOrange,

  ),

);