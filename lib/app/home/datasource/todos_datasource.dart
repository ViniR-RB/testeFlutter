import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';

import '../../core/constants/url.dart';
import '../../core/models/todo_model.dart';
import '../exceptions/todo_exception.dart';

abstract class TodoDataSource {
  Future<List<dynamic>> getTodo();
}

class TodoDataSourceDioImpl implements TodoDataSource {
  Dio dio;
  TodoDataSourceDioImpl({required this.dio});
  Future<List<dynamic>> getTodo() async {
    final response = await dio.get(todosUrl);
    List<dynamic> data = response.data as List;
    return data;
  }
}
