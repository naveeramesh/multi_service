import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_service/utils/colors.dart';
import 'package:home_service/widgets/searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: boxcontainer("Search", appbarcolor, 10, Icons.search),
        ),
      ),
    );
  }
}
