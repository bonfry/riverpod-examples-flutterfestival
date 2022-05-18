import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Lo [StateProvider] è adatto per aggiornare lo stato di strutture
/// dati semplici, come interi, Stringhe ed Enum (no classi complesse,
/// in quanto elementi mutabili)
final stateCounterProvider = StateProvider<int>((ref) {
  return 0; // valore di default
});
