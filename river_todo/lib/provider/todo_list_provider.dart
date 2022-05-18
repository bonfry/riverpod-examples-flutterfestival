import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:river_todo/data.dart';

class TodoListState extends Equatable {
  final List<UserTodo> todos;

  const TodoListState(this.todos);

  @override
  List<Object> get props => [todos];
}

class TodoListNotifier extends StateNotifier<TodoListState> {
  TodoListNotifier(TodoListState state) : super(state);

  void addTodo(UserTodo todo) {
    state = TodoListState([...state.todos, todo]);
  }

  void setTodo(int id, bool check) {
    final index = state.todos.indexWhere((t) => t.id == id);

    if (index != -1) {
      final newTodo = state.todos[index].copyWith(completed: check);
      final todos = List.of(state.todos);

      todos.replaceRange(index, index+1, [newTodo]);
      state = TodoListState(todos);
    }
  }
}

final todoListProvider = StateNotifierProvider.autoDispose<TodoListNotifier,TodoListState>(
  (ref) => TodoListNotifier(const TodoListState([])),
);
