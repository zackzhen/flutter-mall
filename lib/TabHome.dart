import 'package:flutter/material.dart';
import 'package:flutter_app/config/string.dart';
import 'package:video_player/video_player.dart';

class TabHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TabHome();
  }
}

class _TabHome extends State<TabHome> {
  late VideoPlayerController _controller = VideoPlayerController.network(
      'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4')
    ..initialize().then((_) {});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(KString.home_mine),
      ),
      body: Container(
          child: AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
}
