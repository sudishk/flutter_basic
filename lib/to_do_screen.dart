import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_basic/to_do_provider.dart';
import 'package:provider/provider.dart';
class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Provider.of<ToDoProvider>(context, listen: false).getStudents();

    },);
  }
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ToDoProvider>(context);
    return SafeArea(child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
           children: [
             TextField(controller:provider.nameController ,decoration: InputDecoration(hint:Text( "Enter name")),),
             SizedBox(height: 15,),
             TextField(controller:provider.emailController ,decoration: InputDecoration(hint:Text( "Enter email"))),
             SizedBox(height: 30,),
             ElevatedButton(onPressed: () {
               provider.newAdmission();
             }, child: Text("New admission")),
             Consumer<ToDoProvider>(builder: (context, value, child) {
               return Text(" student roll-no:- ${value.studentId}");
             },),
             Consumer<ToDoProvider>(builder: (context, value, child) {
               if(value.selectedImage == null) {
                 return Icon(Icons.browse_gallery_outlined);
               }
               return Image.file(File("${value.selectedImage?.path}"));
             },),
             ElevatedButton(onPressed: () {
               provider.selectImage();
             }, child: Text("Pick image")),
             SizedBox(
               height: 400,
               child: Consumer<ToDoProvider>(builder: (context, value, child) {
                 if(value.students.isEmpty){
                   return Text("Todo list is empty");
                 }

                 return ListView.builder(
                   itemCount: value.students.length,
                   itemBuilder: (context, index) {
                   var student = value.students[index];
                   return ListTile(title: Image.file(File("${student["profile_pic"]}")),subtitle: Text("${student["name"]}, ${student["email"]}"),);
                 },);

               },),
             )
           ],
        ),
      ),
    ));
  }
}
