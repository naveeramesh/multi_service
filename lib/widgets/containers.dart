import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_service/utils/constants.dart';

Container boxcontainer(
    String text, Color color, double radius, IconData icon, double width) {
  return Container(
    height: 50,
    width: width,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(radius)),
    child: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: text,
          hintStyle: GoogleFonts.roboto(color: Colors.black),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.transparent,
          )),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.transparent,
          )),
        ),
      ),
    ),
  );
}

Container box(
    String text, Color color, double radius, double width, Color textcolor) {
  return Container(
    height: 50,
    width: width,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
    ),
    child: Center(
      child: Helper.text(
          text, 18, 0, textcolor, FontWeight.normal, TextAlign.center),
    ),
  );
}

