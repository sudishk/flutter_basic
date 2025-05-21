import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'api_services.dart';

class TodoDetails extends StatefulWidget {
  final String id;
  const TodoDetails({super.key, required this.id});

  @override
  State<TodoDetails> createState() => _TodoDetailsState();
}

class _TodoDetailsState extends State<TodoDetails> {
  TextEditingController userIdController = TextEditingController();
  TextEditingController titleController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          TextField(controller: userIdController , decoration:  InputDecoration(hintText: "Enter userId"),),
          TextField(controller: titleController , decoration:  InputDecoration(hintText: "Enter title"),),
          ElevatedButton(onPressed: ()async {

            var requestBody =  {
              "userId": userIdController.text.toString(),
              "title": titleController.text.toString(),
              "completed": "true"
            };
            var apiResponse =await ApiServices.patchToDo( requestBody, widget.id );

            if(apiResponse != null){
              print(apiResponse);
              Fluttertoast.showToast(msg: "$apiResponse");
              //
            }

          }, child: Text("update ToDo")),
        ],
      ),
    ));
  }
}
