import 'dart:convert';

import 'package:flutter_basic/product_model.dart';
import 'package:http/http.dart' as http;
class ProductApiHelper {
 static Future<List<ProductModel>?> getAllProductApiData()async{
    var response =await http.get(Uri.parse("https://fakestoreapi.com/products"));
    if(response.statusCode == 200){
      var resBody = response.body;
      List<dynamic> jsonBody = jsonDecode(resBody);
      var convertToModel = jsonBody.map((e) =>ProductModel.jsonToModel(e),).toList();

      return convertToModel;
    }
    return null;
  }
}