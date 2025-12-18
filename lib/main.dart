import 'dart:async';
import 'dart:isolate';

import 'package:flutter/foundation.dart';

void main()async{

  final upload =await compute(uploadImage, 1);
  print(upload);
}

int uploadImIage(int a){
  int count = 0;

  Timer.periodic(Duration(seconds: a), (timer) {
    count++;
    if(count==10){
      timer.cancel();
    }

  },);
  return count;
}