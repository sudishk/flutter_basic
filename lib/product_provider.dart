import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/product_api_helper.dart';
import 'package:flutter_basic/product_model.dart';
import 'package:flutter_basic/test_city_model.dart';

class ProductProvider with ChangeNotifier{

  var titleController= TextEditingController();
  var priceController= TextEditingController();
  var descriptionController= TextEditingController();
  var categoryController= TextEditingController();
  var imageController= TextEditingController();
  List<ProductModel> productList=[];
  TestCty? testCty;

  getTestCity()async{
    var city =await ProductApiHelper.getTestCity();
    testCty = city;
    notifyListeners();
  }
  getProduct()async{
    var products =await ProductApiHelper.getAllProductApiData();
    if(products != null){
      productList.clear();
      productList.addAll(products);
      notifyListeners();
    }
  }

  addProduct(BuildContext context)async{
    var data = {
      "title": titleController.text,
      "price": priceController.text,
      "description":descriptionController.text,
      "category": categoryController.text,
      "image": imageController.text
    };
    var response = await ProductApiHelper.postProductApiData();
    if(response != null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data added successfully")));
      getProduct();
    }
  }

  updateProduct(BuildContext context, int id)async{
    var data = {
      "id": id,
      "title": titleController.text,
      "price": priceController.text,
      "description":descriptionController.text,
      "category": categoryController.text,
      "image": imageController.text
    };
    var response = await ProductApiHelper.updateProductApiData(data,);
    if(response != null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data updated successfully")));
      getProduct();
    }
  }

  deleteProduct(BuildContext context, int id) async{
    var response =await ProductApiHelper.deleteProductApi(id);
    if(response != null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Data deleted successfully")));
      getProduct();
    }
  }
}