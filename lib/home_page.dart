import 'package:flutter/material.dart';
import 'package:flutter_basic/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> todoList = [];
  TextEditingController userIdController = TextEditingController();
  TextEditingController titleController  = TextEditingController();
  @override
  void initState() {
    ApiServices.fetchTodoList().then((value) {
      if (value != null) {
        todoList.clear();
        todoList.addAll(value);
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            TextField(controller: userIdController , decoration:  InputDecoration(hintText: "Enter userId"),),
            TextField(controller: titleController , decoration:  InputDecoration(hintText: "Enter title"),),
            ElevatedButton(onPressed: ()async {

              var requestBody =  {
                "userId": userIdController.text.toString(),
                "title": titleController.text.toString(),
                "completed": "false"
              };
              var apiResponse =await ApiServices.createToDo(requestBody);

              if(apiResponse != null){
                print(apiResponse);
                //
              }

            }, child: Text("Create ToDo")),
            SizedBox(
              height: 400,
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context, index) {
                  var todo = todoList[index];
                  return ListTile(
                    title: Text(todo["title"]),
                    subtitle: Text("${todo["completed"]}"),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
