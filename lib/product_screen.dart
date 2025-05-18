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

            StreamBuilder(stream: getCounterData(), builder: (context, snapshot) {
              return Text("${snapshot.data}");
            },)
          ],
        ),
      ),
    );
  }

  Stream<int> getCounterData(){
    return Stream.periodic(Duration(seconds: 2), (computationCount) => computationCount,);
  }
}
