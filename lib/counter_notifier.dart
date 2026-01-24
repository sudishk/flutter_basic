import 'package:flutter_basic/counter_state.dart';
import 'package:flutter_riverpod/legacy.dart';

class CounterNotifier extends StateNotifier<CounterState>{
  CounterNotifier(): super(CounterState(0));

  incrementCounter(){
    state = CounterState(state.count + 1);
  }
  decrement(){
    state = CounterState(state.count-1);
  }

}