import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverbloc_counter/counter_provider.dart';

class Counter extends ConsumerWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CounterState counterState = ref.watch(counterProvider);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          onPressed: () => ref.read(counterProvider.notifier).add(
                CounterIncreased(),
              ),
          icon: const Icon(Icons.add),
        ),
        SizedBox(
          height: 50,
          width: 50,
          child: Center(
            child: Text(counterState.counter.toString()),
          ),
        ),
        IconButton(
          onPressed: () => ref.read(counterProvider.notifier).add(
                CounterDecreased(),
              ),
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
