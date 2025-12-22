import 'package:flutter_basic/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password );
  Future<UserModel> register(Map<String, dynamic> data);
}