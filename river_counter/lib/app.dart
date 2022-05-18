import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_counter/pages.dart';

///[ConsumerWidget] consente di accedere ed aggiornare
///la ui in base ai provider richiamati
class App extends ConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 15, 101, 171),
        ),
      ),
      routes: {
        HomePage.routeName : (_) => const HomePage(),
        StateCounterPage.routeName : (_) => const StateCounterPage(),
        StateNotifierCounterPage.routeName : (_) => const StateNotifierCounterPage(),
      },
      initialRoute:   HomePage.routeName,
     
    );
  }
}
