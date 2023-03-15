import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';

import '../../core/models/todo_model.dart';
import '../adapters/todo_adapter.dart';
import '../datasource/todos_datasource.dart';
import '../exceptions/todo_exception.dart';

abstract class TodoRepository {
  AsyncResult<List<TodoModel>, TodoException> getTodo();
}

class TodoRepositoryImpl implements TodoRepository {
  TodoDataSource dataSource;
  TodoRepositoryImpl({required this.dataSource});
  @override
  AsyncResult<List<TodoModel>, TodoException> getTodo() async {
    try {
      final response = await dataSource.getTodo();

      final List<TodoModel> todo =
          response.map(TodoAdapter.toModel).toList() as List<TodoModel>;
      return Success(todo);
    } on DioError catch (e) {
      return Failure(TodoFetchError(e.message!));
    }
  }
}
