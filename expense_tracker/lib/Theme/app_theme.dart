import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
 

  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade100,
    brightness: Brightness.light,
    primaryColor: Colors.green,
    colorScheme: const ColorScheme.light(
      primary: Colors.green,
      secondary: Colors.green,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
  );

  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black,
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey,
    colorScheme: const ColorScheme.dark(
      primary: Colors.blueGrey,
      secondary: Colors.teal,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
