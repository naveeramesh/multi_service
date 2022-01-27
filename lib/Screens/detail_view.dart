import 'package:flutter/material.dart';
import 'package:home_service/models/mainservice.dart';
import 'package:home_service/utils/constants.dart';
import 'package:home_service/widgets/containers.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class Detail_View extends StatefulWidget {
  final MainService service;
  const Detail_View({Key? key, required this.service}) : super(key: key);

  @override
  _Detail_ViewState createState() => _Detail_ViewState();
}

class _Detail_ViewState extends State<Detail_View> {
  VideoPlayerController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = VideoPlayerController.network(widget.service.video)
      ..initialize().then((_) {
        setState(() {});
      });
    _controller!.play();
    _controller!.setLooping(true);
    _controller!.setVolume(0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<MainService> electricalservice =
        Provider.of<List<MainService>>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: appbarcolor,
        child: const Icon(
          Icons.sell,
          color: Colors.white,
        ),
      ),
      backgroundColor: bgColor,
      body: SizedBox(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: _controller!.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        )
                      : Center(
                          child: Helper.text("Loading...", 20, 0, Colors.black,
                              FontWeight.normal, TextAlign.center)),
                ),
                Positioned(
                    top: 30,
                    left: 10,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.black,
                          size: 18,
                        ),
                      ),
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, top: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Helper.text(widget.service.title.toString(), 20, 0,
                          Colors.black, FontWeight.w600, TextAlign.start),
                      const SizedBox(
                        height: 5,
                      ),
                      Helper.text(widget.service.category.toString(), 15, 0,
                          Colors.grey, FontWeight.w600, TextAlign.start),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20, top: 10),
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.health_and_safety,
                            color: appbarcolor,
                          ),
                          Helper.text("Covid free", 15, 0, Colors.black,
                              FontWeight.normal, TextAlign.center),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Colors.grey,
                    size: 16,
                  ),
                  Helper.text(widget.service.rating.toString(), 13, 0,
                      Colors.grey, FontWeight.normal, TextAlign.start),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
              child: Helper.text("Other Services".toString(), 15, 0,
                  Colors.black, FontWeight.w600, TextAlign.start),
            ),
            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (context, index) {
                  if (electricalservice[index].title != widget.service.title) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 20.0,
                        top: 20,
                      ),
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            width: 90,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        electricalservice[index].image),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 10, right: 20),
              child: Helper.text(widget.service.description.toString(), 15, 0,
                  Colors.grey, FontWeight.normal, TextAlign.start),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage("assets/safe.jpeg"),
                        fit: BoxFit.cover)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
