import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: prefer_const_declarations
final Color bgColor = Colors.white;
// ignore: prefer_const_constructors
final Color iconcolor = Colors.grey[200]!;

// ignore: prefer_const_constructors
final Color appbarcolor = Color.fromRGBO(48, 175, 126, 1);

class Helper {
  static Widget text(String msg, int size, int spacing, Color? color,
      FontWeight fontWeight, TextAlign align) {
    return Text(
      msg,
      textAlign: align,
      style: GoogleFonts.roboto(
          fontWeight: fontWeight,
          fontSize: size.toDouble(),
          color: color,
          letterSpacing: spacing.toDouble()),
    );
  }
}
