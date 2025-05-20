import 'package:flutter/material.dart';
import 'package:flutter_basic/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> todoList = [];

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
        body: ListView.builder(
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
    );
  }
}
