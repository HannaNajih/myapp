//import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

const Color backgroundpagecolor = Color(0xFFEDEDED);
const Color backgroudthemedark = Color.fromARGB(255, 112, 101, 101);
// ignore: constant_identifier_names
const Color Globgreen = Color(0xFF41B03F);
const Color selectionGrayClor = Color(0xFF979797);
const Color selectionWhiteColor = Color(0xFFFFFFFF);
const Color deepGrayTxt = Color(0xFF424242);
const Color grayHintTxt = Color(0xFF7C8DB0);
const Color grayIconClr = Color(0xFF6E7491);
const Color titleColorTxt = Color(0xFF000000);
const Color dateSlctGreen = Color(0xFF00AF3C);
Color? iconCLRCA = Colors.green[200];

//la naw course aakai udemy tyayaty chon zyady akai bo main.dart
class CustomTheme {
  static final light = ThemeData(
    // ignore: deprecated_member_use
    backgroundColor: backgroundpagecolor,
    primaryColor: Globgreen,
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    // ignore: deprecated_member_use
    backgroundColor: backgroudthemedark,
    primaryColor: Globgreen,
    brightness: Brightness.dark,
  );
  TextStyle get headingStyle {
    return TextStyle(
      fontSize: 24,
      // fontWeight: ,
      color: Get.isDarkMode ? Colors.white : Colors.black,
    );
  }
}

TextStyle get buttonTextStyle {
  return GoogleFonts.nunitoSans(
    fontStyle: FontStyle.normal,
    color: selectionWhiteColor,
    fontSize: 23,
    fontWeight: FontWeight.bold,
  );
}

TextStyle get titleTextStyle {
  return GoogleFonts.nunitoSans(
    fontSize: 32,
    color: deepGrayTxt,
    fontWeight: FontWeight.bold,
  );
}

TextStyle get typingTextStyle {
  return GoogleFonts.nunitoSans(
    fontSize: 14,
    color: deepGrayTxt,
    fontWeight: FontWeight.bold,
  );
}

TextStyle get hintTextStyle {
  return GoogleFonts.nunitoSans(
    fontSize: 14,
    color: grayHintTxt,
  );
}

TextStyle get myplanner {
  return GoogleFonts.lilyScriptOne(
    fontStyle: FontStyle.normal,
    fontSize: 40,
    color: Globgreen,
  );
}

TextStyle get myplannerAppbar {
  return GoogleFonts.lilyScriptOne(
    fontStyle: FontStyle.normal,
    fontSize: 20,
    color: Globgreen,
  );
}
