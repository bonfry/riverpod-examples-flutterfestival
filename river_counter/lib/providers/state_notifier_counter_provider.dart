import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_counter/providers.dart';

class StateNotifierCounter extends StateNotifier<int> {
  StateNotifierCounter([int start = 0]) : super(start);

  void increase() => state += 1;
  void decrease() => state = state > 0 ? state - 1 : state;
}

//Quando non viene più usato viene cancellato lo stato, per poi ricrearlo quando richiamato
final stateNotifierCounterProvider =
    StateNotifierProvider.autoDispose<StateNotifierCounter, int>(
  (ref) {
    // E' possibile combinare più provider per realizzare un unico provider
    final startValue = ref.read(stateCounterProvider);
    return StateNotifierCounter(startValue);
  },
);
