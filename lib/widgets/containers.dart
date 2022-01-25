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
          hintStyle: GoogleFonts.roboto(color: Colors.grey),
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

Container drawer_bar() {
  return Container(
      color: Colors.blueGrey,
      child: Column(children: [
        const SizedBox(
          height: 50,
        ),
        const CircleAvatar(
          radius: 50,
          backgroundColor: Colors.white,
          child: Icon(Icons.person, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            top: 30,
          ),
          child: Row(
            children: [
              Helper.text("Home", 18, 0, Colors.white, FontWeight.normal,
                  TextAlign.center),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            top: 30,
          ),
          child: Row(
            children: [
              Helper.text("Appoinments", 18, 0, Colors.white, FontWeight.normal,
                  TextAlign.center),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            top: 30,
          ),
          child: Row(
            children: [
              Helper.text("Search", 18, 0, Colors.white, FontWeight.normal,
                  TextAlign.center),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            top: 30,
          ),
          child: Row(
            children: [
              Helper.text("Offers", 18, 0, Colors.white, FontWeight.normal,
                  TextAlign.center),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            top: 30,
          ),
          child: Row(
            children: [
              Helper.text("Customer Care", 18, 0, Colors.white,
                  FontWeight.normal, TextAlign.center),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            top: 30,
          ),
          child: Row(
            children: [
              Helper.text("Who we are", 18, 0, Colors.white, FontWeight.normal,
                  TextAlign.center),
            ],
          ),
        ),
        const Spacer(),
        box("Signin / Join", Colors.white, 10, 250, Colors.black),
        const SizedBox(
          height: 20,
        ),
      ]));
}
