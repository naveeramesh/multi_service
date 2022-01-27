import 'package:flutter/material.dart';
import 'package:home_service/Screens/remove_glow.dart';
import 'package:home_service/main.dart';
import 'package:home_service/models/mainservice.dart';
import 'package:home_service/models/service.dart';
import 'package:home_service/utils/constants.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatefulWidget {
  final String name;
  const CategoryView({Key? key, required this.name}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    List<MainService> service = Provider.of<List<MainService>>(context);
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: bgColor,
          elevation: 0,
          title: Helper.text(widget.name, 18, 0, Colors.black, FontWeight.bold,
              TextAlign.center),
        ),
        backgroundColor: bgColor,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView.builder(
            itemCount: service.length,
            itemBuilder: (context, index) {
              if (service[index].category == widget.name) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20, top: 20),
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: iconcolor,
                    ),
                    child: Row(
                      children: [
                        Container(
                            height: 80,
                            width: 90,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: NetworkImage(service[index].image),
                                    fit: BoxFit.cover))),
                        const SizedBox(
                          width: 20,
                        ),
                        Helper.text(service[index].title.toString(), 15, 0,
                            Colors.black, FontWeight.normal, TextAlign.center)
                      ],
                    ),
                  ),
                );
              } else {
                return const SizedBox();
              }
            },
          ),
        ),
      ),
    );
  }
}
