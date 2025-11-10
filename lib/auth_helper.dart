import 'dart:convert';

import 'package:http/http.dart' as http;
class AuthHelper {
 static Future<Map<String, dynamic>?> login(Map<String, dynamic> data)async{

   var headers = {
     'Content-Type': 'application/json'
   };
   var request = http.Request('POST', Uri.parse('https://api-music-3fw1.onrender.com/api/project/login'));
   request.body = json.encode(data);
   request.headers.addAll(headers);

   http.StreamedResponse response = await request.send();

   if (response.statusCode == 200) {
     var body = await response.stream.bytesToString();
     var jsonResponse = jsonDecode(body);

     return jsonResponse;
   }
   else {
     print(null);
   }
  //   var res =await http.post(Uri.parse("https://api-music-3fw1.onrender.com/api/project/login"), body: data);
  //
  //   if(res.statusCode ==200){
  //     var jsonResponse = jsonDecode(res.body);
  //     return jsonResponse;
  //   }
  //
  //   return null;
  }
}