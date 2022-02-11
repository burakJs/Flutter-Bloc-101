abstract class CounterState {
  CounterState();
}

class CounterInitial extends CounterState {
  CounterInitial();
}

class CounterLoading extends CounterState {
  CounterLoading();
}

class CounterSuccess extends CounterState {
  int? counter;
  CounterSuccess({this.counter});
}

class CounterError extends CounterState {
  String? error;
  CounterError({this.error});
}
