import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_counter/pages.dart';
import 'package:river_counter/providers.dart';

class HomePage extends ConsumerWidget {
  static String routeName = "/home";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTitle = ref.watch(appTitleProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
               onPressed: () => Navigator.pushNamed(context, StateCounterPage.routeName),
              child: const Text('Counter State Page'),
            ),
            const SizedBox(height:15),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, StateNotifierCounterPage.routeName),
              child: const Text('Counter State Notifier Page'),
            ),
          ],
        ),
      ),
    );
  }
}
