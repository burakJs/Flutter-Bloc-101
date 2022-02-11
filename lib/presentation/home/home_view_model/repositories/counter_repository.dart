import 'package:bloc_training/presentation/home/home_view_model/repositories/ICounter_repository.dart';

class CounterRepository extends ICounterRepository {
  @override
  int counterAdd(int count) => count + 1;
}
