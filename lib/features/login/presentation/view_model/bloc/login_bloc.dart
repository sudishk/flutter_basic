import 'package:bloc/bloc.dart';
import 'package:flutter_basic/features/login/domain/usecases/login_user.dart';
import 'package:flutter_basic/features/login/presentation/view_model/bloc/login_event.dart';
import 'package:flutter_basic/features/login/presentation/view_model/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUser loginUser;

  LoginBloc(this.loginUser) : super(const LoginState()) {
    on<LoginButtonPressed>(_onLoginPressed);
  }

  Future<void> _onLoginPressed(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    try {
      final user = await loginUser(event.email, event.password);
      emit(state.copyWith(isLoading: false, user: user));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }
}
