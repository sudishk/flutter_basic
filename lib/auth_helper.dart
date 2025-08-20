import 'dart:convert';

import 'package:http/http.dart' as http;
class AuthHelper {
 static Future<Map<String, dynamic>?> login(Map<String, dynamic> data)async{
    var res =await http.post(Uri.parse("https://edugaondev.com/firebase-api-main/api/login"), body: data);
    if(res.statusCode ==200){
      var jsonResponse = jsonDecode(res.body);
      return jsonResponse;
    }

    return null;
  }
}