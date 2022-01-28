import 'package:flutter/material.dart';
import 'package:home_service/Screens/homescreen.dart';
import 'package:home_service/models/users.dart';
import 'package:home_service/service/auth.dart';
import 'package:home_service/utils/constants.dart';
import 'package:home_service/widgets/containers.dart';
import 'package:provider/provider.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final Users? users = Provider.of<Users?>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: bgColor,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Helper.text("Serwe", 20, 0, Colors.black, FontWeight.bold,
                  TextAlign.center),
              const SizedBox(
                height: 5,
              ),
              Helper.text("Signin / Login", 18, 0, Colors.black,
                  FontWeight.normal, TextAlign.center),
              const SizedBox(
                height: 50,
              ),
              GestureDetector(
                  onTap: () async {
                    await _authService.signinAnonymus().whenComplete(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (b) => const HomeScreen()));
                    });
                  },
                  child: box("Signin without Password", appbarcolor, 10, 250,
                      Colors.white)),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () async {
                    await _authService.signInWithGoogle().whenComplete(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (b) => const HomeScreen()));
                    });
                  },
                  child: box("Signin with Google", appbarcolor, 10, 250,
                      Colors.white)),
              const Spacer(),
              Helper.text("By signing in to Serwe you accept to the ", 15, 0,
                  Colors.grey, FontWeight.normal, TextAlign.center),
              const SizedBox(
                height: 3,
              ),
              Helper.text("Terms and Conditions", 15, 0, Colors.blue,
                  FontWeight.normal, TextAlign.center),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
