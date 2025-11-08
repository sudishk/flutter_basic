import 'package:flutter/material.dart';
import 'package:riverpod/legacy.dart';
import 'package:riverpod/riverpod.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final counterProvider = StateProvider<int>((ref) => 0);
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final count = Provider((ref) => counterProvider,)
        count.watch(counterProvider);

    return const Placeholder();
  }
}





