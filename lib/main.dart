import 'package:bloc_training/presentation/home/home_view_model/repositories/counter_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/home/home_view/home_view.dart';
import 'presentation/home/home_view_model/counter_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: BlocProvider(
        create: (_) => CounterCubit(repository: CounterRepository()),
        child: HomeView(),
      ),
    );
  }
}
