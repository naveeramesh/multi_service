import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_service/advance_drawer/appbar_provider.dart';
import 'package:home_service/models/mainservice.dart';
import 'package:home_service/models/offer.dart';
import 'package:home_service/models/service.dart';
import 'package:home_service/models/users.dart';
import 'package:home_service/service/auth.dart';
import 'package:home_service/service/database.dart';
import 'package:provider/provider.dart';

import 'Screens/homescreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppBar_Drawer(),
        ),
        StreamProvider<Users?>.value(
          value: AuthService().user,
          initialData: null,
        ),
        StreamProvider<List<Offer>>.value(
          value: FbDatabase().getoffer("Offers"),
          initialData: [],
        ),
        StreamProvider<List<Service>>.value(
          value: FbDatabase().getdata("Services"),
          initialData: [],
        ),
        StreamProvider<List<MainService>>.value(
          value: FbDatabase().getelectrical("Main Service"),
          initialData: [],
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const SplashScreen()),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 4),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (b) => const HomeScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: SizedBox(
        child: Text(
          "Serwe",
          style: GoogleFonts.roboto(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      )),
    );
  }
}
