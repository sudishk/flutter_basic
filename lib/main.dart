import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/home_page_provider.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => HomePageProvider(),),
        StreamProvider(create: (context) =>HomePageProvider.getCounter(), initialData: 0),
        FutureProvider(create: (context) => HomePageProvider.fetchName(), initialData: "Data Loading")
      ],
      child:MyApp() ,)
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    var name = Provider.of<String>(context);
    var counter = Provider.of<int>(context);
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Text(name),
          Image.asset("assets/small_icon.jpg"),
          Text("$counter"),
          Consumer<HomePageProvider>(builder: (context, value, child) {
            return Text("${value.age}");
          },),

          ElevatedButton(onPressed: () {
            Provider.of<HomePageProvider>(context, listen: false).changeAge();
          }, child: Text("Change Age"))
        ],
      ),
    ));
  }
}
