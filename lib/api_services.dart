import 'dart:convert';

import 'package:http/http.dart' as http ;// as is using for name changing or taking all functionality in http
class ApiServices {
  
 static Future<dynamic> getAllPostList()async{
    var response =await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if(response.statusCode == 200){
      var data = response.body;
      var jsonData = jsonDecode(data);

      return jsonData;
    }
    return null;
  }
}