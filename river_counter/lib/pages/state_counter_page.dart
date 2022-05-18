import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_counter/providers.dart';

class StateCounterPage extends ConsumerWidget {
  static String routeName = "/state_counter";

  const StateCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTitle = ref.watch(appTitleProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("$appTitle - State Counter"),
        actions: [
          IconButton(
            onPressed: () => ref.read(stateCounterProvider.notifier).state = 0,
            icon: const Icon(Icons.repeat),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(ref.watch(stateCounterProvider).toString()),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    child: const Text('Aumenta'),
                    onPressed: () => ref
                        .read(stateCounterProvider.notifier)
                        .update((state) => state + 1),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: const Text('Diminuisci'),
                    onPressed: () => ref
                        .read(stateCounterProvider.notifier)
                        .update((state) => state - 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
