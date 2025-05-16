import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text("Menu"),
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
              PopupMenuItem(child: Text("Cart"), value: "Cart",),
              PopupMenuItem(child: Text("Orders"), value: "Orders",),
              PopupMenuItem(child: Text("WishList"), value: "WishList",),
            ],
            onSelected: (value) {
                // Navigator.pop
                print(value);

            },
            )
          ],


        ),
        body: Column(
          children: [
            ElevatedButton(onPressed: () {
              showMenu(
                  position: RelativeRect.fromLTRB(100, 150, 0, 0),
                  context: context, items: [
                PopupMenuItem(child: Text("Add"), value: "Add",),
                PopupMenuItem(child: Text("Delete"), value: "Delete",),
              ]).then((value) {
                print(value);
              },);
            }, child: Text("Show context menu")),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
              return ListTile(trailing: PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(child: Text("Update"), value: "Update",),
                  PopupMenuItem(child: Text("Delete"), value: "Delete",),
                ],
                onSelected: (value) {
                  // Navigator.pop
                  print(value);

                },
              ), title: Text("Item $index"),);
            },)

          ],
        ),
      ),
    );
  }
}
