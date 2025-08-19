import 'package:flutter/material.dart';
import 'package:flutter_basic/product_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var provider = Provider.of<ProductProvider>(context, listen: false);
    provider.getProduct();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(child: Scaffold(
      body: Consumer<ProductProvider>(builder: (context, value, child) {
        if(value.productList.isEmpty){
          return Text("No products");
        }else{
          return ListView.builder(
            itemCount: value.productList.length,
            itemBuilder: (context, index) {
              var product = value.productList[index];
            return ListTile(
              title: Text("${product?.title}"),
              subtitle: Text("${product?.description}"),
            );
          },);
        }
      },),
    )
    );
  }
}
