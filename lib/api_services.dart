import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  static Future<List<dynamic>?> fetchTodoList() async {
    var response = await http.get(
      Uri.parse("https://jsonplaceholder.typicode.com/todos"),
    );
    if (response.statusCode == 200) {
      var resBody = jsonDecode(response.body);
      print(resBody);
      return resBody;
    } else {
      print("Api calling failed");
    }
  }

  static Future<dynamic> createToDo(Map<String, dynamic> requestBody) async {
    try {
      var response = await http.post(
        Uri.parse("https://jsonplaceholder.typicode.com/todos"),
        body: requestBody,
      );
      if (response.statusCode == 201) {
        var jsonResponseBody = jsonDecode(response.body);
        return jsonResponseBody;
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<dynamic> updateAllToFields( Map<String, dynamic> requestBody , String toDoId,) async{
    try {
      var response = await http.put(
          Uri.parse("https://jsonplaceholder.typicode.com/todos/$toDoId"));
      if (response.statusCode == 200) {
        var jsonRes = jsonDecode(response.body);
        return jsonRes;
      }
    }catch (error){
      print(error);
    }
  }

  static Future<dynamic> patchToDo( Map<String, dynamic> requestBody , String toDoId,) async{
    try {
      var response = await http.patch(
          Uri.parse("https://jsonplaceholder.typicode.com/todos/$toDoId"));
      if (response.statusCode == 200) {
        var jsonRes = jsonDecode(response.body);
        return jsonRes;
      }
    }catch (error){
      print(error);
    }
  }
}
