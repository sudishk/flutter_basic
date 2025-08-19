import 'package:flutter/cupertino.dart';
import 'package:flutter_basic/product_api_helper.dart';
import 'package:flutter_basic/product_model.dart';

class ProductProvider with ChangeNotifier{
  List<ProductModel> productList=[];
  getProduct()async{
    var products =await ProductApiHelper.getAllProductApiData();
    if(products != null){
      productList.clear();
      productList.addAll(products);
      notifyListeners();
    }
  }
}