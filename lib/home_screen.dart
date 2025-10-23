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
  int updateIndex = 0;
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
            ElevatedButton(onPressed: () {
              nameList.add(nameController.text);
              setState(() {

              });
            }, child: Text("Add Name")),
            ElevatedButton(onPressed: () {
              nameList[updateIndex] = nameController.text;

              setState(() {

              });
            }, child: Text("Update Name")),
            Container(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),

                itemCount: nameList.length,
                itemBuilder: (context, index) {
                  var name = nameList[index];
                  return ListTile(title: Text(name), trailing: Container(width: 100, child: Row(children: [
                    IconButton(onPressed: () {
                      nameController.text = nameList[index];
                      updateIndex = index;
                      setState(() {

                      });
                    }, icon: Icon(Icons.edit)),

                    IconButton(onPressed: () {
                      nameList.removeAt(index);
                      setState(() {

                      });
                    }, icon: Icon(Icons.delete)),
                  ],)),);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
