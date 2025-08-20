import 'dart:convert';

import 'package:flutter_basic/product_model.dart';
import 'package:http/http.dart' as http;
class ProductApiHelper {
 static Future<List<ProductModel>?> getAllProductApiData()async{
    var response =await http.get(Uri.parse("https://fakestoreapi.com/products"));
    // var postMethodResponse =await http.post(Uri.parse("https://fakestoreapi.com/products"), headers: {},body: {});
    // var putMethodResponse =await http.put(Uri.parse("https://fakestoreapi.com/products"),headers: {},body: {});
    // var patchMethodResponse =await http.patch(Uri.parse("https://fakestoreapi.com/products"),headers: {},body: {});
    // var deleteMethodResponse =await http.delete(Uri.parse("https://fakestoreapi.com/products"),headers: {},body: {});
    if(response.statusCode == 200){
      var resBody = response.body;
      var json = {'name': 'ram', 'age':23};
      var jsonString = jsonEncode(json);
      List<dynamic> jsonBody = jsonDecode(resBody); // convert String data to json for taking value in key and vale
      var convertToModel = jsonBody.map((e) =>ProductModel.jsonToModel(e),).toList(); // converting map

      return convertToModel;
    }
    return null;
  }

 static Future<ProductModel?> postProductApiData(Map<String, dynamic> data)async{
   var response =await http.post(Uri.parse("https://fakestoreapi.com/products"),body: data);
   print(response.body);
   if(response.statusCode == 201){
     var resBody = response.body;
     dynamic jsonBody = jsonDecode(resBody); // convert String data to json for taking value in key and vale
     var convertToModel = ProductModel.jsonToModel(jsonBody); // converting map
     return convertToModel;
   }
   return null;
 }
 static Future<ProductModel?> updateProductApiData(Map<String, dynamic> data)async{
   var response =await http.put(Uri.parse("https://fakestoreapi.com/products/${data['id']}"),body: data);
   print(response.body);
   if(response.statusCode == 200){
     var resBody = response.body;
     dynamic jsonBody = jsonDecode(resBody); // convert String data to json for taking value in key and vale
     var convertToModel = ProductModel.jsonToModel(jsonBody); // converting map
     return convertToModel;
   }
   return null;
 } 
 static Future<String?> deleteProductApi(int id)async{
   var response =await http.delete(Uri.parse("https://fakestoreapi.com/products/$id"));
   if(response.statusCode==200){
     return "success";
   }
   return null;
 }

}