import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTheme{
  static const lightThemeFont ='Winky_Sans' , darkThemeFont = 'Montserrat,Winky_Sans';
  static Color lightThemeColor =Colors.red,
      white=Colors.white,
      black=Colors.black,
      darkThemeColor=Colors.yellow;

  static final lightTheme =ThemeData(
      primaryColor:lightThemeColor,
      brightness: Brightness.light,
      scaffoldBackgroundColor: white,
      useMaterial3: true,
      fontFamily:lightThemeFont,
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.resolveWith<Color>((states)=>lightThemeColor),
      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: white,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(fontWeight: FontWeight.w500,
            color: black,
            fontSize: 23,
          ),
          iconTheme: IconThemeData(color: lightThemeColor),
          elevation: 0,
          actionsIconTheme: IconThemeData(color: lightThemeColor),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: white,
            statusBarIconBrightness: Brightness.dark,
          )
      )
  );

  //darkTheme
  static final darkTheme= ThemeData(
      primaryColor: darkThemeColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: black,
      useMaterial3: true,
      fontFamily: darkThemeFont,
      switchTheme: SwitchThemeData(
        trackColor:
        MaterialStateProperty.resolveWith<Color>((States)=>darkThemeColor),

      ),
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: black,
          scrolledUnderElevation: 0,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: white,
            fontSize: 23,
          ),
          iconTheme: IconThemeData(color: darkThemeColor),
          elevation: 0,
          actionsIconTheme: IconThemeData(color: darkThemeColor),
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: black,
              statusBarIconBrightness: Brightness.dark
          )
      )

  );
}