import 'package:bloc_training/core/constants/string_constants.dart';
import 'package:bloc_training/core/extensions/int_extension.dart';
import 'package:bloc_training/presentation/home/home_view_model/counter_cubit.dart';
import 'package:bloc_training/presentation/home/home_view_model/counter_state.dart';
import 'package:bloc_training/presentation/home/home_view_model/repositories/counter_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part '../parts/instance_part.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stringInstance.counterTitle),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            if (state is CounterLoading) {
              return _counterCenterCircularProgressIndicator();
            } else if (state is CounterInitial) {
              return _counterInitalText(context);
            } else if (state is CounterSuccess) {
              return _counterSuccessText(state, context);
            } else {
              return _counterErrorText(state as CounterError, context);
            }
          },
        ),
      ),
      floatingActionButton: _counterIncrementFAButton(context),
    );
  }

  FloatingActionButton _counterIncrementFAButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        context.read<CounterCubit>().counterIncrement();
      },
    );
  }

  Center _counterCenterCircularProgressIndicator() => const Center(child: CircularProgressIndicator());

  Text _counterInitalText(BuildContext context) {
    return Text(
      0.toCounterBody,
      style: Theme.of(context).textTheme.headline3?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
    );
  }

  Text _counterSuccessText(CounterSuccess state, BuildContext context) {
    return Text(
      (state.counter ?? 0).toCounterBody,
      style: Theme.of(context).textTheme.headline3?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
    );
  }

  Text _counterErrorText(CounterError state, BuildContext context) {
    return Text(
      state.error ?? 'ERROR',
      style: Theme.of(context).textTheme.headline3?.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
    );
  }
}
