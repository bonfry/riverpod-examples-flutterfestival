import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_counter/providers.dart';

class StateNotifierCounterPage extends ConsumerWidget {
  static String routeName = "/state_notifier_counter";

  const StateNotifierCounterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTitle = ref.watch(appTitleProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text("$appTitle - State Counter Notifier"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
             Expanded(
              child: Center(
                child: Text( ref.watch(stateNotifierCounterProvider).toString()),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                    child: const Text('Aumenta'),
                    onPressed: ()  => ref.read(stateNotifierCounterProvider.notifier).increase(),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    child: const Text('Diminuisci'),
                    onPressed: () => ref.read(stateNotifierCounterProvider.notifier).decrease() ,
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
