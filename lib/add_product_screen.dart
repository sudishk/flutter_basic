import 'package:flutter/material.dart';
import 'package:flutter_basic/product_provider.dart';
import 'package:provider/provider.dart';

import 'app_widgets.dart';

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
             customTextField( provider.titleController, "Title",Icons.title),
             halfTextField( provider.priceController,  "Price",context),
             customTextField( provider.descriptionController,"Description",Icons.discord_rounded),
             customTextField(provider.categoryController,"Category",Icons.category),
             customTextField( provider.imageController, "Image",Icons.image),
             customeBtton( () {
               provider.addProduct(context);
             }, "Add Now")
           ],
         ),
      ),
    );
  }


}
