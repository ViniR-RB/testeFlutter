import 'package:flutter/material.dart';
import 'package:testes/app/home/repository/todo_repository.dart';

import '../state/todo_state.dart';

class TodoStore extends ChangeNotifier {
  final TodoRepository _repository;
  TodoStore(this._repository, this._state);
  TodoState _state;

  void _emit(TodoState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> fetchTodo() async {
    _emit(TodoLoadginState());

    final todo = await _repository.getTodo();
    _emit(TodoLoadedState());
  }
}
