import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:video_player/video_player.dart';
import '../data/TrainingVideoDetails.dart';
import 'assign_quiz_page.dart';

class TrainingVideoPage extends StatefulWidget {
  const TrainingVideoPage({Key? key}) : super(key: key);

  @override
  State<TrainingVideoPage> createState() => _TrainingVideoPageState();
}

class _TrainingVideoPageState extends State<TrainingVideoPage> {
  List<TrainingVideoDetails> training_video_details = [];
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  bool? flag = false;

  void isVideoEnded() {
    if (_controller.value.position >= _controller.value.duration) {
      setState(() {
        flag = true;
      });
      if (flag == true) {
        print("Video Ended");
        _controller.pause();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => AssignQuizPage(),
          ),
        );
      }
    }
  }

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      "https://www.w3schools.com/html/mov_bbb.mp4",
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(false);

    super.initState();
  }

  @override
  void dispose() {
    _controller.removeListener(isVideoEnded);
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.addListener(isVideoEnded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFeeeeee),
                      borderRadius: BorderRadius.circular(10)),
                  height: 300,
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          setState(
                            () {
                              if (_controller.value.isPlaying) {
                                isVideoEnded();
                              } else {
                                _controller.play();
                              }
                            },
                          );
                        },
                        child: ButtonBar(
                          alignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.black,
                            ),
                            Text(
                              _controller.value.isPlaying ? "Pause" : "Play",
                              style: GoogleFonts.nunitoSans(
                                textStyle: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
