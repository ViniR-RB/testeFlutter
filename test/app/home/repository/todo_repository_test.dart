import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import 'package:testes/app/home/datasource/todos_datasource.dart';
import 'package:testes/app/home/repository/todo_repository.dart';

class DataSourceMock extends Mock implements TodoDataSource {}

void main() {
  final TodoDataSource dataSource = DataSourceMock();
  final TodoRepository repository = TodoRepositoryImpl(dataSource: dataSource);
  test("It should return me list of TodoModel", () async {
//act
    final data = await dataSource.getTodo();

    final result = await repository.getTodo();

    //assert
    when(() => data).thenReturn(data);
    //expect
    expect(result.toSuccess(), isNotNull);
    expect(result.isSuccess(), true);
  });
}
