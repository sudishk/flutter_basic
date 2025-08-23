import 'dart:convert';

import 'package:flutter_basic/product_model.dart';
import 'package:flutter_basic/test_city_model.dart';
import 'package:http/http.dart' as http;
class ProductApiHelper {
  static Future<TestCty?> getTestCity()async{
    var result =await http.post(Uri.parse("https://superastrologer.com/Testcitty/index"),
        body:  jsonEncode({"key":"abc"}), headers: {"auth": "Bearer: b91cc1e43370911555e55ead1706eb78"} );
   if(result.statusCode==200) {
     var jsonBody = jsonDecode(result.body);
     var jsonModel = TestCty.jsonToModel(jsonBody);
     return jsonModel;
   }
   return null;
  }
 static Future<List<ProductModel>?> getAllProductApiData()async{
   var result =await http.get(Uri.parse("https://fakestoreapi.com/products"),);
   if(result.statusCode==200){
     var reyBoy=result.body;
     List<dynamic> json=jsonDecode(reyBoy);
     var jsnModal=json.map((e) => ProductModel.jsonToModel(e)).toList();
     return jsnModal;
     
   }
   return null;
  }































 static Future<ProductModel?> postProductApiData()async{
   var data = {"key":"abc"};
   var response =await http.post(Uri.parse("https://fakestoreapi.com/products"),body: data, headers: {"auth":"Bearer: b91cc1e43370911555e55ead1706eb78"});
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