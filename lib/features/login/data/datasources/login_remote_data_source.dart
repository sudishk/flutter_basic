import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

class LoginRemoteDataSource {
  final baseUrl = 'https://shopee-api-v0rv.onrender.com/api/user'; // Replace with your API URL

  Future<UserModel> loginUser(String email, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to login');
    }
  }
}
