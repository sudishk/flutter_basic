import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:video_player/video_player.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<XFile>? image;
  XFile? video;
   VideoPlayerController? _controller;

  void checkPermission(ImageSource source)async{
    final ImagePicker picker = ImagePicker();

    var cameraPermission = await Permission.camera.status.isGranted;
    var galleryPermission = await Permission.photos.status.isGranted;
    if(source == ImageSource.camera && !cameraPermission){
      await Permission.camera.request();
    }else if(source == ImageSource.gallery && !galleryPermission) {
      await Permission.photos.request();
    }

    if(source == ImageSource.gallery && galleryPermission){
      image =await picker.pickMultiImage();
    }else {
     video =await picker.pickVideo(source: ImageSource.camera);
     _controller = VideoPlayerController.file(File(video!.path));
    await _controller?.initialize();
    _controller?.play();

    }
    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            image != null? SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: image!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                var img = image![index];
                return Image.file(File(img.path));
              },),
            ):Icon(Icons.browse_gallery),
            SizedBox(
              height: 150,
              child: video!=null ? VideoPlayer(_controller!): Icon(CupertinoIcons.video_camera) ,
            ),
            Row(
              children: [
                ElevatedButton(onPressed: () {

                  checkPermission(ImageSource.camera);
                }, child: Text("video")),
                ElevatedButton(onPressed: () {
                  checkPermission(ImageSource.gallery);
                }, child: Text("Gallery"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

