import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class constants {
  static final TextStyle nametextStyle =
      GoogleFonts.quicksand(fontSize: 20, fontWeight: FontWeight.w500);

  static final TextStyle darknametextStyle = GoogleFonts.quicksand(
      fontSize: 20, fontWeight: FontWeight.w500, color: Colors.white);

  static final TextStyle idtextstyle =
      GoogleFonts.quicksand(fontSize: 14, fontWeight: FontWeight.w400);

  static final TextStyle darkidtextstyle = GoogleFonts.quicksand(
      fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);

  static final TextStyle pricetextstyle =
      GoogleFonts.quicksand(fontSize: 29, fontWeight: FontWeight.w500);

  static final TextStyle darkpricetextstyle = GoogleFonts.quicksand(
      fontSize: 29, fontWeight: FontWeight.w500, color: Colors.white);

  static final TextStyle mcaptextstyle = GoogleFonts.quicksand(fontSize: 15);

  static final TextStyle darkmcaptextstyle =
      GoogleFonts.quicksand(fontSize: 15, color: Colors.white);

  static final TextStyle percentstyle = GoogleFonts.quicksand(
      fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 1.2);

  static final TextStyle darkpercentstyle = GoogleFonts.quicksand(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.2,
      color: Colors.white);

  static final TextStyle appbarstyle = GoogleFonts.quicksand(
      fontSize: 30,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.3,
      color: Colors.black);
  static const Color darkshade = Color(0xff282A4F);
}
