import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserTodo extends Equatable {
  final int id;
  final String title;
  final bool completed;

  const UserTodo({
    required this.id,
    required this.title,
    required this.completed,
  });

  UserTodo copyWith({
    int? id,
    String? title,
    bool? completed,
  }) {
    return UserTodo(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'completed': completed,
    };
  }

  factory UserTodo.fromMap(Map<String, dynamic> map) {
    return UserTodo(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      completed: map['completed'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserTodo.fromJson(String source) =>
      UserTodo.fromMap(json.decode(source));

  @override
  List<Object?> get props => [id, title, completed];
}