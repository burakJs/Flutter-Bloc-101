import 'package:bloc_training/presentation/home/home_view_model/counter_state.dart';
import 'package:bloc_training/presentation/home/home_view_model/repositories/ICounter_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  final ICounterRepository repository;

  CounterCubit({required this.repository}) : super(CounterInitial());
  int counter = 0;

  void counterIncrement() {
    emit(CounterLoading());
    counter = repository.counterAdd(counter);
    if (counter == 15) {
      emit(CounterError());
    } else {
      emit(CounterSuccess(counter: counter));
    }
  }
}
