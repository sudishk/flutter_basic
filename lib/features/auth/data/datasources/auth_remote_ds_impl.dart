import 'dart:convert';

import 'package:flutter_basic/core/global/strings.dart';
import 'package:flutter_basic/features/auth/data/datasources/auth_remote_ds.dart';
import 'package:flutter_basic/features/auth/data/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthRemoteDataSourceImpl  implements AuthRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password)async {
    final response =await http.post(Uri.parse(loginUrl), body: {
      "email": email,
      "password": password,
    });

    if(response.statusCode==200){
      final json = jsonDecode(response.body);
      return UserModel.fromJson(json);
    }else{
      throw Exception("Failed to login");
    }
  }

  @override
  Future<UserModel> register(Map<String, dynamic> data)async {
    final response = await http.post(Uri.parse(registerUrl), body: data);
    if(response.statusCode==200){
      final json = jsonDecode(response.body);
      return UserModel.fromJson(json);
    }else{
      throw Exception("Failed to register");
    }
  }
}