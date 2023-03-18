import 'package:testes/app/core/models/todo_model.dart';

abstract class TodoAdapter {
  TodoAdapter._();
  static TodoModel toModel(dynamic map) {
    return TodoModel(
        id: map['id'], title: map['title'], completed: map['completed']);
  }
}
