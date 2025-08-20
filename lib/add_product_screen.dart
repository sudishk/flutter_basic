import 'package:flutter/material.dart';
import 'package:flutter_basic/product_provider.dart';
import 'package:provider/provider.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add Product"),
        ),
         body: Column(
           children: [
             TextField(controller: provider.titleController, decoration: InputDecoration(hintText: "Title"),),
             TextField(controller: provider.priceController, decoration: InputDecoration(hintText: "Price"),),
             TextField(controller: provider.descriptionController, decoration: InputDecoration(hintText: "Description"),),
             TextField(controller: provider.categoryController, decoration: InputDecoration(hintText: "Category"),),
             TextField(controller: provider.imageController, decoration: InputDecoration(hintText: "Image"),),
             ElevatedButton(onPressed: () {
               provider.addProduct(context);
             }, child: Text("Add Now"))
           ],
         ),
      ),
    );
  }
}
