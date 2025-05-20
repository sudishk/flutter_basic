import 'dart:convert';

import 'package:http/http.dart' as http;
class ApiServices{
 static Future<List<dynamic>?> fetchTodoList()async {
    var response =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    if(response.statusCode == 200){
      var resBody = jsonDecode(response.body);
      print(resBody);
      return resBody;
    }else{
      print("Api calling failed");
    }
  }
}