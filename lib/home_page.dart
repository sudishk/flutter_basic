import 'package:flutter/material.dart';
import 'package:flutter_basic/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> todoList = [];
  TextEditingController userIdController= TextEditingController();
  TextEditingController titleController= TextEditingController();

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

            TextField(controller: userIdController,decoration: InputDecoration(hintText: "Enter user id", border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),),
            TextField(controller: titleController,decoration: InputDecoration(hintText: "Enter title", border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),),
            ElevatedButton(onPressed: () async{
              var uid = int.parse(userIdController.text);
              var bodyMap = {
                "userId": userIdController.text,
                "title":titleController.text,
                "completed": "false"
              };
             var result =await ApiServices.createToDo(bodyMap);
             print(result);
            }, child: Text("Create Todo")),
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
