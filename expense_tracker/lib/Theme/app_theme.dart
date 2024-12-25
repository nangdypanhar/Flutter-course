import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
      primary: Color(0xFF014C63),
      secondary: Color(0xFF014C63), 
      surface: Colors.white, 
      onPrimary: Colors.white,
      onSecondary: Colors.green, 
      onSurface: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.grey.shade100,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: Colors.blueGrey, 
      secondary: Colors.blueGrey,
      surface: Colors.grey.shade900, 
      onPrimary: Colors.white,
      onSecondary: Colors.white, 
      onSurface: Colors.white, 
    ),
    scaffoldBackgroundColor: Colors.black12,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
