import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(length: 3, child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(tabs: [
            Tab(child: Text("Tab1")),
            Tab(child: Text("Tab12")),
            Tab(child: Text("Tab2")),
          ]),
        ),
        body: TabBarView(children: [
          RequestedBooking(),
          Container(color: Colors.pink,),
          Container(color: Colors.yellow,),

        ]),
      )),
    );
  }
}

class RequestedBooking extends StatefulWidget {
  const RequestedBooking({super.key});

  @override
  State<RequestedBooking> createState() => _RequestedBookingState();
}

class _RequestedBookingState extends State<RequestedBooking> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder(

    );
  }
}
