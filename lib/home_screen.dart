import 'package:flutter/material.dart';
import 'package:flutter_basic/add_product_screen.dart';
import 'package:flutter_basic/product_provider.dart';
import 'package:flutter_basic/update_product_screen.dart';
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
    var provider = Provider.of<ProductProvider>(context, listen: false);

    return SafeArea(child: Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => AddProductScreen(),));
      },child: Icon(Icons.add),),
      body: Consumer<ProductProvider>(builder: (context, value, child) {
        if(value.productList.isEmpty){
          return Text("No products");
        }else{
          return ListView.builder(
            itemCount: value.productList.length,
            itemBuilder: (context, index) {
              var product = value.productList[index];
            return ListTile(
              trailing: SizedBox(width: 100,child: Row(children: [IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateProductScreen(id: product.id??0),));
              },
                  icon: Icon(Icons.edit)),
                IconButton(onPressed: () {
                  provider.deleteProduct(context, product.id??0);
                  }, icon: Icon(Icons.delete))
              ],),),
              title: Text("${product?.title}"),
              subtitle: Text("${product?.description}"),
            );
          },);
        }
      },),
    ),
    );
  }
}
