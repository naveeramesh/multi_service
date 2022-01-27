import 'package:flutter/material.dart';
import 'package:home_service/models/mainservice.dart';
import 'package:home_service/models/service.dart';
import 'package:home_service/utils/constants.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  const DetailScreen({Key? key, required this.name}) : super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    List<MainService> service = Provider.of<List<MainService>>(context);
    return Scaffold(
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
              return Container();
            } else {
              return SizedBox();
            }
          },
        ),
      ),
    );
  }
}
