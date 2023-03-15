import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testes/app/home/datasource/todos_datasource.dart';

class DioMock extends Mock implements Dio {}

void main() {
  test("It should return me a dynamic list of Todos", () async {
    //assert
    final dio = DioMock();
    final datasource = TodoDataSourceDioImpl(dio: dio);
    final reponse = Response(
        data: jsonresponse,
        statusCode: 200,
        requestOptions: RequestOptions(path: ''));

    //act
    when(() => dio.get(any())).thenAnswer((_) async => reponse);
    final todo = await datasource.getTodo();
    //except
    expect(todo, isA<List<dynamic>>());
  });
}

const jsonresponse = [
  {"id": 1, "title": "delectus aut autem", "completed": false},
  {"id": 2, "title": "quis ut nam facilis et officia qui", "completed": false},
];
