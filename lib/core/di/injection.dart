
import 'package:flutter_basic/features/auth/auth_injection.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
Future<void> init()async{
  await authInjection();
}