import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_service/utils/colors.dart';

Container boxcontainer(String text,Color color, double radius, IconData icon) {
  return Container(
    height: 50,
    width: 300,
    decoration: BoxDecoration(
        color: color, borderRadius: BorderRadius.circular(radius)),
    child: TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: iconcolor),
        hintText: text,
        hintStyle: GoogleFonts.roboto(color: Colors.white),
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
  );
}
