import 'package:flutter/material.dart';
import 'package:flutter_basic/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  @override
  Widget build(BuildContext context) {
    print("build called");
    var provider = Provider.of<HomeProvider>(context,listen:false);
    return SafeArea(child: Scaffold(
      body: Column(
        children: [
          Consumer<HomeProvider>(
            builder: (context, value, child) {
              return Text(provider.message);
            },),
          ElevatedButton(onPressed: () {
            provider.updateMessage();
          }, child: Text("Refresh"))
        ],
      )
      // ChangeNotifierProvider(
      //   create:(context) => HomeProvider() ,
      //   builder:(context, child) {
      //     var provider = context.watch<HomeProvider>();
      //     return Column(
      //       children: [
      //         Text(provider.message),
      //         ElevatedButton(onPressed: () {
      //           provider.updateMessage();
      //         }, child: Text("Refresh"))
      //       ],
      //     );
      //   } ,
      //
      // ),
    ));
  }
}
