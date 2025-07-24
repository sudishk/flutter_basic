import 'dart:convert';

import 'package:flutter_basic/place_api_model.dart';
import 'package:http/http.dart' as http;
class MapApiServices{

 static Future<PlaceApiModel?> searchLocation(String searchText)async{
    var response =await http.post(Uri.parse("https://places.googleapis.com/v1/places:searchText"),
        body: {
      "textQuery": searchText
    },
      headers: {
      "X-Goog-Api-Key": "",
      "X-Goog-FieldMask": "*"
      }
    );

    if(response.statusCode==200){
      var jsonResponse = jsonDecode(response.body);
      var modelResponse = PlaceApiModel.fromJson(jsonResponse);
      return modelResponse;
    }else{
      return null;
    }

  }
}