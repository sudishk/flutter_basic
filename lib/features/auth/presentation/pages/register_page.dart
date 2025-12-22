import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class RegisterPage extends StatelessWidget {
  final firstNameCtrl = TextEditingController();
  final lastNameCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final genderCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<AuthBloc>(),
      child: Scaffold(
        appBar: AppBar(title: Text("Register")),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Welcome ${state.user.name}")),
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return Center(child: CircularProgressIndicator());
            }

            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(controller: firstNameCtrl),
                  TextField(controller: lastNameCtrl),
                  TextField(controller: addressCtrl),
                  TextField(controller: genderCtrl),
                  TextField(controller: phoneCtrl),
                  TextField(controller: emailCtrl),
                  TextField(controller: passCtrl),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().add(
                        RegisterRequested(
                            {
                              "first_name": firstNameCtrl.text,
                              "last_name": lastNameCtrl.text,
                              "address" : addressCtrl.text,
                              "gender" : genderCtrl.text,
                              "email" : emailCtrl.text,
                              "password" : passCtrl.text,
                              "number" : phoneCtrl.text,
                              "agent_id":"2",
                              "fcm_token":"ksbd-m nkca",
                              "new_user":"0",
                              "other_referral_code":"dfv-dfv -sdf",
                              "referral_code":"wedfv-dfv",
                              "status":"1",
                              "type":"user"
                            }

                        ),
                      );
                    },
                    child: Text("Register"),
                  ),
                  if (state is LoginError)
                    Text(state.message, style: TextStyle(color: Colors.red)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
