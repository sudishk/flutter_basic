import 'package:equatable/equatable.dart';

import '../../../domain/entities/user.dart';

class LoginState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final User? user;

  const LoginState({
    this.isLoading = false,
    this.errorMessage,
    this.user,
  });

  LoginState copyWith({
    bool? isLoading,
    String? errorMessage,
    User? user,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [isLoading, errorMessage, user];
}
