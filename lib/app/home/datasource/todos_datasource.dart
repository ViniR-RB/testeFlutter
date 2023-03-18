import 'package:dio/dio.dart';
import 'package:result_dart/result_dart.dart';
import 'package:testes/app/home/exceptions/todo_exception.dart';

import '../../core/constants/url.dart';

abstract class TodoDataSource {
  AsyncResult<List<dynamic>, TodoException> getTodo();
}

class TodoDataSourceDioImpl implements TodoDataSource {
  Dio dio;
  TodoDataSourceDioImpl({required this.dio});
  @override
  AsyncResult<List<dynamic>, TodoException> getTodo() async {
    final response = await dio.get(todosUrl);
    if (response.statusCode == 500) {
      return Failure(TodoFetchError('Foi impossível carregar a Lista de Todos'));
    }
    List<dynamic> data = response.data;
    return Success(data);
  }
}
