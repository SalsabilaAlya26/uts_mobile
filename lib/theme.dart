import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color primaryPink = Color(0xFFFFC0CB);
final Color rosePink = Color(0xFFF4ACB7);
final Color cream = Color(0xFFFFF0F3);
final Color softText = Color(0xFF4A4A4A);

ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: Colors.white,
  textTheme: GoogleFonts.poppinsTextTheme().apply(bodyColor: softText),
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    elevation: 0,
    iconTheme: IconThemeData(color: softText),
    titleTextStyle: GoogleFonts.poppins(color: softText, fontSize: 18, fontWeight: FontWeight.w600),
  ),
  colorScheme: ColorScheme.fromSeed(seedColor: primaryPink).copyWith(
    primary: primaryPink,
    secondary: rosePink,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryPink,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      textStyle: TextStyle(fontWeight: FontWeight.w600),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFFFF6F8),
    contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
  ),
);
