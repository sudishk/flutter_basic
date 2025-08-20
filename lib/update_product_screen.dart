import 'package:flutter/material.dart';
import 'package:flutter_basic/product_provider.dart';
import 'package:provider/provider.dart';

class UpdateProductScreen extends StatefulWidget {
  final int id;
  const UpdateProductScreen({super.key, required this.id});

  @override
  State<UpdateProductScreen> createState() => _UpdateProductScreenState();
}

class _UpdateProductScreenState extends State<UpdateProductScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProductProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Update Product"),
        ),
        body: Column(
          children: [
            TextField(controller: provider.titleController, decoration: InputDecoration(hintText: "Title"),),
            TextField(controller: provider.priceController, decoration: InputDecoration(hintText: "Price"),),
            TextField(controller: provider.descriptionController, decoration: InputDecoration(hintText: "Description"),),
            TextField(controller: provider.categoryController, decoration: InputDecoration(hintText: "Category"),),
            TextField(controller: provider.imageController, decoration: InputDecoration(hintText: "Image"),),
            ElevatedButton(onPressed: () {
              provider.updateProduct(context, widget.id);
            }, child: Text("Update Now"))
          ],
        ),
      ),
    );
  }
}
