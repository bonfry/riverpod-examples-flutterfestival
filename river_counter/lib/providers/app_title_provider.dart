import 'package:flutter_riverpod/flutter_riverpod.dart';

///Provider fisso (non può cambiare dal'esterno che consente 
///di conservare il titolo dell'app)
final appTitleProvider = Provider<String>((ref)=> "River Counter");