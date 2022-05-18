import 'package:flutter/material.dart';
import 'package:riverbloc/riverbloc.dart';

@immutable
class CounterState {
  final int counter;

  const CounterState(this.counter);
}

@immutable
class CounterEvent {}

class CounterIncreased extends CounterEvent {}

class CounterDecreased extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(0)) {
    
    on<CounterIncreased>(
      (event, emit) => emit(CounterState(state.counter + 1)),
    );

    on<CounterDecreased>(
      (event, emit) => emit(CounterState(state.counter - 1)),
    );
  }
}

final counterProvider = BlocProvider<CounterBloc,CounterState>((ref) =>CounterBloc() );