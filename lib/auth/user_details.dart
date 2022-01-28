import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_service/utils/constants.dart';
import 'package:home_service/widgets/containers.dart';

class User_Details extends StatefulWidget {
  const User_Details({Key? key}) : super(key: key);

  @override
  _User_DetailsState createState() => _User_DetailsState();
}

class _User_DetailsState extends State<User_Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Helper.text("Let's get connect more", 25, 0, Colors.black,
                  FontWeight.bold, TextAlign.center),
            ),
            const SizedBox(
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Helper.text("Enter your details", 15, 0, Colors.grey,
                  FontWeight.normal, TextAlign.center),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person,
                            size: 15,
                            color: Color.fromRGBO(48, 175, 126, 1),
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          hintText: "First Name",
                          hintStyle: GoogleFonts.roboto(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.normal)),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey[200],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.person,
                              size: 15,
                              color: Color.fromRGBO(48, 175, 126, 1),
                            ),
                            enabledBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            hintText: "Last Name",
                            hintStyle: GoogleFonts.roboto(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.normal)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.email,
                        size: 15,
                        color: Color.fromRGBO(48, 175, 126, 1),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      hintText: "Email",
                      hintStyle: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.phone_android,
                        size: 15,
                        color: Color.fromRGBO(48, 175, 126, 1),
                      ),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent)),
                      hintText: "+91",
                      hintStyle: GoogleFonts.roboto(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.normal)),
                ),
              ),
            ),
            const Spacer(),
            Center(child: box("Upload", appbarcolor, 10, 300, Colors.white)),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
