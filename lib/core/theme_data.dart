import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    labelStyle: const TextStyle(color: Color.fromARGB(39, 255, 255, 255)),
    hintStyle: const TextStyle(
        fontFamily: 'Sniglet',
        color: Color.fromARGB(135, 255, 255, 255),
        fontSize: 25,
        fontWeight: FontWeight.normal),
    errorStyle:const TextStyle(
        fontFamily: 'Sniglet',
        color: Color.fromARGB(135, 255, 255, 255),
        fontSize: 15,
        fontWeight: FontWeight.normal), 
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(40),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(40),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Color.fromARGB(255, 252, 112, 102), width: 2),
      borderRadius: BorderRadius.circular(40),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 2),
      borderRadius: BorderRadius.circular(40),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(TextStyle(
        fontSize: 25,
        fontFamily: 'Sniglet',
        foreground: Paint()
          ..shader = const LinearGradient(colors: [
            Color.fromARGB(255, 81, 56, 124),
            Color.fromARGB(255, 90, 149, 251)
          ]).createShader(
            const Rect.fromLTRB(0.0, 0.0, 200.0, 70.0),
          ),
      )),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
      minimumSize:
          MaterialStateProperty.all<Size>(const Size(double.infinity, 45)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40), side: BorderSide.none),
      ),
    ),
  ),
);
