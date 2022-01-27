import 'package:flutter/material.dart';
import 'package:home_service/models/mainservice.dart';
import 'package:home_service/utils/constants.dart';
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
    return Scaffold(
      backgroundColor: bgColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
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
                    left: 0,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                        size: 18,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
