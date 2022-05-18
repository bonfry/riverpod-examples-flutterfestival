import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_todo/data.dart';
import 'package:river_todo/provider.dart';

class TodoForm extends ConsumerWidget {
  final _textController = TextEditingController();
   TodoForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Column(
        children: [
          const Text('Inserisci un TODO'),
          const SizedBox(height: 20),
          TextFormField(
            controller: _textController,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                if (_textController.text.isEmpty) {
                  return;
                }

                ref.read(todoListProvider.notifier).addTodo(
                      UserTodo(
                          id: Random().nextInt(1000),
                          title: _textController.text,
                          completed: false),
                    );
              },
              child: const Text('Crea TODO')),
        ],
      ),
    );
  }
}
