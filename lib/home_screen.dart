import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            // Stream builder start

            StreamBuilder(stream: fetchCounter(), builder: (context, snapshot) {
              if(snapshot.hasError){
                return Text(snapshot.error.toString());
              } else if(snapshot.hasData){
                return Text(snapshot.data.toString());
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            },),


            // Stream builder end

            // future builder start
            FutureBuilder(future: fetchUser(), builder: (context, snapshot) {
              if(snapshot.hasError){
                return Container(color: Colors.red, child: Text(snapshot.error.toString()),);
              } else if(snapshot.hasData){
                return Container(color: Colors.grey, child: Text(snapshot.data.toString()),);
              }
              else{
                return Center(child: CircularProgressIndicator(),);
              }
            },)
            // future builder end

          ],
        ) ,
      ),

    );
  }

 Future<String> fetchUser()async{
   return await Future.delayed(Duration(seconds: 5), () => "Mohan",);
  }

  Stream<int> fetchCounter(){
    return  Stream.periodic(Duration(seconds: 2), (computationCount) => computationCount+1,);
  }

}
