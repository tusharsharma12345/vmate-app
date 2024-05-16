import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayingVideoScreen extends StatefulWidget {
  String url;
  String title;
  PlayingVideoScreen({super.key, required this.url, required this.title});

  @override
  State<PlayingVideoScreen> createState() => _PlayingVideoScreenState();
}

class _PlayingVideoScreenState extends State<PlayingVideoScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  bool play = true;

  @override
  void initState() {
    super.initState();

    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        widget.url,
      ),
    );

    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.setVolume(1);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: InkWell(
                    onTap: () {
                      if (play == true) {
                        _controller.pause();
                        play = false;
                      } else {
                        _controller.play();
                        play = true;
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            height: 220,
                            child: VideoPlayer(_controller)),
                      ],
                    )),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        Text(
          widget.title,
          style: TextStyle(fontSize: 30),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              Icons.thumb_up,
              size: 40,
            ),
            Icon(
              Icons.thumb_down,
              size: 40,
            ),
            Icon(
              Icons.share,
              size: 40,
            ),
          ],
        )
      ],
    ));
  }
}
