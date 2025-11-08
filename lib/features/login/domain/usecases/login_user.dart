import '../repositories/login_repository.dart';
import '../entities/user.dart';

class LoginUser {
  final LoginRepository repository;

  LoginUser(this.repository);

  Future<User> call(String email, String password) async {
    return await repository.login(email, password);
  }
}
