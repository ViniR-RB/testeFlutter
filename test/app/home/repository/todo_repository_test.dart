import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testes/app/home/datasource/todos_datasource.dart';
import 'package:testes/app/home/repository/todo_repository.dart';

class DataSourceMock extends Mock implements TodoDataSource {}

void main() {
  final TodoDataSource dataSource = DataSourceMock();
  final TodoRepository repository = TodoRepositoryImpl(dataSource: dataSource);
  test('', () async {
    //act
    final data = await dataSource.getTodo();
    data.isSuccess();
    //assert
    when(() async => data.isSuccess()).thenReturn(true);
    //expect
  });
}

final List<dynamic> todo = [
  {"id": 1, "title": "delectus aut autem", "completed": false}
];
