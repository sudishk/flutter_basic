import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  const MyVideoPlayer({super.key});

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  XFile? video;
  VideoPlayerController? videoPlayerController;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Column(
      children: [
        ElevatedButton(onPressed: ()async {
           video =await ImagePicker().pickVideo(source: ImageSource.camera);
           videoPlayerController = VideoPlayerController.file(File(video!.path));
          await videoPlayerController?.initialize();
          videoPlayerController?.play();
        }, child: Text('pic Video')),

        SizedBox( height: 400, width: 350,child:video!= null? VideoPlayer(videoPlayerController!, ): Icon(Icons.video_call),)
      ],
    )));
  }
}
