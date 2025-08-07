import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/theme_provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MultiProvider(providers: [
     ChangeNotifierProvider(create: (context) => ThemeProvider(),)
  ], child: MyApp(),));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: provider.getThemeMode(),
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Row(
                spacing: 100,
                children: [
                  Text("Sudish"),
                  Text("Sudish"),
                ],
              ),
              Row(
                spacing: 100,

                children: [
                Text("Sudish"),
                Text("Sudish"),
              ],),

              Text("Sudish"),
              Text("Sudish"),
              Text("Sudish"),
              Text("Sudish"),
              Icon(Icons.person),
              TextField(decoration: InputDecoration(hintText: "Enter name"),),
              // Image.network("src"),
              ElevatedButton(onPressed: () {
                provider.changeTheme();
              }, child: Text("Click me"))

            ],
          ),
        ),
      ),
    );
  }
}
