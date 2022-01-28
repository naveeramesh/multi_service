import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:home_service/Screens/categoryview.dart';
import 'package:home_service/Screens/detail_view.dart';
import 'package:home_service/Screens/remove_glow.dart';
import 'package:home_service/advance_drawer/appbar_provider.dart';
import 'package:home_service/auth/signin.dart';
import 'package:home_service/main.dart';
import 'package:home_service/models/mainservice.dart';
import 'package:home_service/models/offer.dart';
import 'package:home_service/models/service.dart';
import 'package:home_service/models/users.dart';
import 'package:home_service/service/auth.dart';
import 'package:home_service/utils/constants.dart';
import 'package:home_service/widgets/containers.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    AppBar_Drawer appBarDrawer = Provider.of<AppBar_Drawer>(context);
    List<Service> service = Provider.of<List<Service>>(context);
    List<Offer> offer = Provider.of<List<Offer>>(context);
    List<MainService> electricalservice =
        Provider.of<List<MainService>>(context);

    return AdvancedDrawer(
      backdropColor: Colors.grey[200],
      controller: appBarDrawer.advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black12,
            blurRadius: 0.0,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: Drawer(elevation: 0, child: drawerbar()),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: Scaffold(
          backgroundColor: bgColor,
          appBar: AppBar(
            backgroundColor: bgColor,
            elevation: 0,
            title: Helper.text("Screw", 20, 0, Colors.black, FontWeight.bold,
                TextAlign.center),
            leading: IconButton(
              onPressed: appBarDrawer.handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: appBarDrawer.advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                      color: Colors.black,
                    ),
                  );
                },
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20),
                        child: boxcontainer("Search...", Colors.grey[200]!, 10,
                            Icons.search, 400),
                      ),
                    ),
                    offer.isEmpty
                        ? const Center(child: SizedBox())
                        : SizedBox(
                            child: Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: CarouselSlider.builder(
                              itemCount: 4,
                              itemBuilder: (context, index, realIndex) {
                                return Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                offer[index].image),
                                            fit: BoxFit.cover)));
                              },
                              options: CarouselOptions(
                                height: 150.0,
                                enlargeCenterPage: true,
                                autoPlay: true,
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enableInfiniteScroll: true,
                                autoPlayAnimationDuration:
                                    const Duration(milliseconds: 800),
                              ),
                            ),
                          )),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Helper.text("Choose your service", 18, 0,
                          Colors.black, FontWeight.w500, TextAlign.start),
                    ),
                    SizedBox(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 20),
                        child: GridView.builder(
                          itemCount: service.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (b) => CategoryView(
                                                name: service[index]
                                                    .title
                                                    .toString(),
                                              )));
                                },
                                child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[200]),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            width: 100,
                                            child: Image.network(
                                                service[index].image),
                                          ),
                                        ])),
                              ),
                            );
                          },
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 100,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 20),
                      child: Helper.text("Electrical Appliances", 18, 0,
                          Colors.black, FontWeight.w500, TextAlign.start),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 5),
                      child: Helper.text("Appliances we do for service", 14, 0,
                          Colors.grey, FontWeight.normal, TextAlign.start),
                    ),
                    SizedBox(
                      height: 170,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: electricalservice.length,
                        itemBuilder: (context, index) {
                          if (electricalservice[index].category ==
                              "Electricals") {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                top: 20,
                              ),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (b) => Detail_View(
                                                  service: electricalservice[
                                                      index])));
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  electricalservice[index]
                                                      .image),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Helper.text(
                                      electricalservice[index].title.toString(),
                                      15,
                                      0,
                                      Colors.black,
                                      FontWeight.normal,
                                      TextAlign.center),
                                ],
                              ),
                            );
                          } else {
                            return SizedBox();
                          }
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                      ),
                      child: Helper.text("Cleaning", 18, 0, Colors.black,
                          FontWeight.w500, TextAlign.start),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, top: 5),
                      child: Helper.text("Works in Cleaning", 14, 0,
                          Colors.grey, FontWeight.normal, TextAlign.start),
                    ),
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: electricalservice.length,
                        itemBuilder: (context, index) {
                          if (electricalservice[index].category == "Cleaning") {
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                top: 20,
                              ),
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (b) => Detail_View(
                                                  service: electricalservice[
                                                      index])));
                                    },
                                    child: Container(
                                      height: 100,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  electricalservice[index]
                                                      .image),
                                              fit: BoxFit.cover),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Helper.text(
                                      electricalservice[index].title.toString(),
                                      15,
                                      0,
                                      Colors.black,
                                      FontWeight.normal,
                                      TextAlign.center),
                                ],
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                    ),
                  ]),
            ),
          ),
        ),
      ),
    );
  }

  Container drawerbar() {
    final Users? users = Provider.of<Users?>(context);
    final AuthService _authService = AuthService();
    return Container(
        color: Colors.grey[200],
        child: Column(children: [
          const SizedBox(
            height: 50,
          ),
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black,
            child: Icon(Icons.person, color: Colors.white),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 30.0,
              top: 30,
            ),
            child: Row(
              children: [
                Helper.text("Home", 18, 0, Colors.black, FontWeight.normal,
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
                Helper.text("Appoinments", 18, 0, Colors.black,
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
                Helper.text("Search", 18, 0, Colors.black, FontWeight.normal,
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
                Helper.text("Offers", 18, 0, Colors.black, FontWeight.normal,
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
                Helper.text("Customer Care", 18, 0, Colors.black,
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
                Helper.text("Who we are", 18, 0, Colors.black,
                    FontWeight.normal, TextAlign.center),
              ],
            ),
          ),
          const Spacer(),
          users?.uid == null
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (b) =>const Signin()));
                  },
                  child:
                      box("Signin / Join", Colors.black, 10, 250, Colors.white))
              : GestureDetector(
                  onTap: () {
                    _authService
                        .signout()
                        .whenComplete(() =>  Navigator.pushReplacement(
                        context, MaterialPageRoute(builder: (b) =>const SplashScreen())));
                  },
                  child: box("Logout", Colors.black, 10, 250, Colors.white)),
          const SizedBox(
            height: 20,
          ),
        ]));
  }
}
