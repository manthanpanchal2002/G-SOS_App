import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import '../Routes/routes.dart';
import '../data/TrainingVideoDetails.dart';

class TrainingVideoPage extends StatefulWidget {
  const TrainingVideoPage({super.key});

  @override
  State<TrainingVideoPage> createState() => _TrainingVideoPageState();
}

class _TrainingVideoPageState extends State<TrainingVideoPage> {
  List<TrainingVideoDetails> training_video_details = [];
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    _controller = VideoPlayerController.network(
      "http://192.168.60.137/gsos/video/physical_security.mp4",
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            );
          } else {
            return Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // pause
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // play
              _controller.play();
            }
          });
        },
        // icon
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  // Future<List<TrainingVideoDetails>> getData() async {
  //   final response = await http.get(Uri.parse(
  //       "http://$ipAddress/gsos/api.php?entity=training_video&id=1"));
  //   var data = jsonDecode(response.body.toString());

  //   if (response.statusCode == 200) {
  //     for (Map<String, dynamic> index in data) {
  //       training_video_details.add(TrainingVideoDetails.fromJson(index));
  //     }
  //     return training_video_details;
  //   } else {
  //     return training_video_details;
  //   }
  // }
}
