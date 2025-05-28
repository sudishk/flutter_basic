import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var nameList = [
    "Harsh",
    "Sneha",
    "Rohit",
    "Deepak",
    "Rohit",
    "Deepak",
    "Rohit",
    "Deepak",
  ];

  var nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // body: ListView(
        //   children: [
        //     Container(color: Colors.blueGrey, height: 300,),
        //     Container(color: Colors.redAccent, height: 100,)
        //   ],
        // ),
        // body: ListView.builder(
        //   itemCount: 30,
        //   itemBuilder: (context, index){
        //     var name = "Name $index";
        //     return Text(name);
        //   },
        // ),
        body: Column(
          children: [
            TextField(controller: nameController),
            Container(
              height: 200,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return Container(color: Colors.green, height: 100, width: 200,);
                },
                itemCount: nameList.length,
                itemBuilder: (context, index) {
                  var name = nameList[index];
                  return Text(name);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
