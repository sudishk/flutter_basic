import 'package:flutter_basic/core/usecases/usecase.dart';
import 'package:flutter_basic/core/utils/either.dart';
import 'package:flutter_basic/features/auth/domain/entities/user.dart';
import 'package:flutter_basic/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_basic/core/error/failure.dart';


class LoginUseCase extends UseCase<User, LoginParams> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(LoginParams params) {
    return repository.login(params.email, params.password);
  }

  @override
  Future<Either<Failure, User>> callRegister(Map<String, dynamic> params) {
    return repository.register(params);
  }
}

class LoginParams{
  final String email;
  final String password;
  LoginParams(this.email, this.password);
}