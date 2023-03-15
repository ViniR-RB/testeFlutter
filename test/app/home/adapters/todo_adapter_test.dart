import 'package:flutter_test/flutter_test.dart';

import 'package:testes/app/core/models/todo_model.dart';
import 'package:testes/app/home/adapters/todo_adapter.dart';

void main() {
  test("It Should then convert Map in TodoModel", () {
    final map = {"id": 1, "title": "delectus aut autem", "completed": false};
    final todo = TodoAdapter.toModel(map);
    TodoModel compare =
        TodoModel(id: 1, title: "delectus aut autem", completed: false);

    expect(todo, compare);
  });
}
