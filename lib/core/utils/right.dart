import 'package:flutter_basic/core/utils/either.dart';

class Right<L, R> extends Either<L,R>{
  final R value;
  Right(this.value);
  @override
  T fold<T>(T Function(L l) leftFn, T Function(R r) rightFn) {
    return rightFn(value);
  }
}