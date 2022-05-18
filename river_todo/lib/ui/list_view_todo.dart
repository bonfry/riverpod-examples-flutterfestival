import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_todo/provider.dart';

class ListViewTodo extends ConsumerWidget {
  const ListViewTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoListProvider).todos;

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (ctx, i) {
        final todo = todos[i];
        return ListTile(
          title: Text(todo.title),
          trailing: Checkbox(
            value: todo.completed,
            onChanged: (value) {
              ref.read(todoListProvider.notifier).setTodo(
                    todo.id,
                    value == true,
                  );
            },
          ),
        );
      },
    );
  }
}
