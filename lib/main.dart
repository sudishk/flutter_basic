import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/features/login/presentation/pages/login_page.dart';
import 'package:provider/provider.dart';

import 'features/login/data/datasources/login_remote_data_source.dart';
import 'features/login/data/repositories/login_repository_impl.dart';
import 'features/login/domain/repositories/login_repository.dart';
import 'features/login/domain/usecases/login_user.dart';
import 'features/login/presentation/view_model/login_viewmodel.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final dataSource = LoginRemoteDataSource();
    final repository = LoginRepositoryImpl(dataSource);
    final useCase = LoginUser(repository);

    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => LoginViewModel(useCase),)
    ], child:MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ) ,);
  }
}


