import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

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

  XFile? image;
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
      image =await picker.pickImage(source: ImageSource.gallery);
    }else {
      image =await picker.pickImage(source: ImageSource.camera);

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

            image != null? Image.file(File(image!.path)):Icon(Icons.browse_gallery),
            Row(
              children: [
                ElevatedButton(onPressed: () {

                  checkPermission(ImageSource.camera);
                }, child: Text("Camera")),
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

