import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  final String name;
  final int? age;

  const ProductScreen({super.key, required this.name, this.age});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Text("${widget.name}"),
            Text("${widget.age}"),
            ElevatedButton(onPressed:  () {
              Navigator.pop(context, "Ram");
            }, child: Text("Go Back")),
      
            Container(child: InkWell(
              onTap: () {
              },
                child: Center(child: Text("Product Screen")))
            ),
          ],
        ),
      ),
    );
  }
}
