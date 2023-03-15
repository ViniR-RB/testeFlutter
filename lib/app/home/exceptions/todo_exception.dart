abstract class TodoException implements Exception {
  final String menssage;
  final StackTrace? stackTrace;
  TodoException(this.menssage, [this.stackTrace]);
}

class TodoFetchError extends TodoException {
  TodoFetchError(super.menssage);
}
