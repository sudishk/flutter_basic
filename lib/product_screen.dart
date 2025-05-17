import 'package:flutter/material.dart';
import 'package:flutter_basic/product_details.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

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
            ElevatedButton(onPressed:  () {
              Navigator.pop(context);
            }, child: Text("Go Back")),
      
            Container(child: InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ProductDetails(),),(route) => false,);
              },
                child: Center(child: Text("Product Screen")))
            ),
          ],
        ),
      ),
    );
  }
}
