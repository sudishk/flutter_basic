// Dart ka IO library import kiya file operations ke liye (image/file handling)
import 'dart:io';

// Flutter ki Material library import — UI components banane ke liye
import 'package:flutter/material.dart';

// Apna custom provider file import — isme ToDoProvider ka class define hoga
import 'package:flutter_basic/to_do_provider.dart';

// Provider package import — state management ke liye
import 'package:provider/provider.dart';

// ToDoScreen ek StatefulWidget hai kyunki isme state change hoti hai
class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key}); // Constructor with optional key

  @override
  State<ToDoScreen> createState() => _ToDoScreenState(); // State create karne ka method
}

// Screen ka actual state logic
class _ToDoScreenState extends State<ToDoScreen> {

  @override
  void initState() {
    super.initState();
    // 2 second delay ke baad students list fetch karne ka kaam
    Future.delayed(Duration(seconds: 2), () {
      // Provider se getStudents() call — data fetch hoga
      Provider.of<ToDoProvider>(context, listen: false).getStudents();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Provider instance ko access kar rahe hai
    var provider = Provider.of<ToDoProvider>(context);

    return SafeArea( // Status bar ke niche se UI start karega
      child: Scaffold( // Screen ka base layout
        body: Padding( // Screen me spacing dena
          padding: const EdgeInsets.all(15.0),
          child: ListView( // Scrollable content
            children: [
              // Name input field
              TextField(
                controller: provider.nameController, // Provider me stored controller
                decoration: InputDecoration(
                  hint: Text("Enter name"), // Placeholder text
                ),
              ),
              SizedBox(height: 15,), // Space between widgets

              // Email input field
              TextField(
                controller: provider.emailController,
                decoration: InputDecoration(
                  hint: Text("Enter email"),
                ),
              ),
              SizedBox(height: 30,), // Space before button

              // New admission button
              ElevatedButton(
                onPressed: () {
                  provider.newAdmission(); // New student data add karega
                },
                child: Text("New admission"),
              ),

              // Student roll number display (Consumer to update only this widget)
              Consumer<ToDoProvider>(
                builder: (context, value, child) {
                  return Text(" student roll-no:- ${value.studentId}");
                },
              ),

              // Student image display
              Consumer<ToDoProvider>(
                builder: (context, value, child) {
                  // Agar image select nahi hui hai
                  if (value.selectedImage == null) {
                    return Icon(Icons.browse_gallery_outlined);
                  }
                  // Agar image select ho gayi hai
                  return Image.file(File("${value.selectedImage?.path}"));
                },
              ),

              // Image picker button
              ElevatedButton(
                onPressed: () {
                  provider.selectImage(); // Image select karne ka method
                },
                child: Text("Pick image"),
              ),

              // Student list display
              SizedBox(
                height: 400, // Fixed height for list
                child: Consumer<ToDoProvider>(
                  builder: (context, value, child) {
                    // Agar list empty hai
                    if (value.students.isEmpty) {
                      return Text("Todo list is empty");
                    }

                    // Students list show karna
                    return ListView.builder(
                      itemCount: value.students.length,
                      itemBuilder: (context, index) {
                        var student = value.students[index];
                        return ListTile(
                          // Student ka profile picture
                          title: Image.file(File("${student["profile_pic"]}")),
                          // Student ka name & email
                          subtitle: Text("${student["name"]}, ${student["email"]}"),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
