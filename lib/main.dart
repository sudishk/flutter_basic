import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/home_page_provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage() ,
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => HomePageProvider() ,
        builder: (context, child) {
          var provider = context.watch<HomePageProvider>();
        return  Column(
            children: [
              Text(provider.data),

              ElevatedButton(onPressed: () {
                provider.changeData();
              }, child: Text("Change Data"))
            ],
          );
        },

      ),
    );
  }
}
