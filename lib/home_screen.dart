import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;
  late Animation<Color?> colorAnimation;
  late Animation<Alignment> alignAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(vsync: this, duration: Duration(seconds: 5));

    animation = Tween<double>(begin: 0.0, end: 300.0).animate(animationController)
      ..addListener(() {
      setState(() {

      });
    },);

    // colorAnimation = ColorTween(begin: Colors.red, end: Colors.blueGrey,).animate(animationController);
    colorAnimation = TweenSequence<Color?>([
      TweenSequenceItem(tween: ColorTween(begin: Colors.orange ,end: Colors.green), weight: 1),
      TweenSequenceItem(tween: ColorTween(begin: Colors.brown ,end: Colors.grey), weight: 2),
      TweenSequenceItem(tween: ColorTween(begin: Colors.purpleAccent ,end: Colors.cyan), weight: 1),
    ]).animate(animationController);

    alignAnimation = AlignmentTween(end: Alignment.bottomCenter, begin: Alignment.bottomRight).animate(animationController);
    animationController.forward();


  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body:Column(
          children: [
            // Stream builder start

            Container(
              height: animation.value,
              width: animation.value,
              color: colorAnimation.value,

            ),

            Align(
                alignment: alignAnimation.value,
                child: Container( height: 40,width: 50, color: Colors.deepOrange,)),
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
