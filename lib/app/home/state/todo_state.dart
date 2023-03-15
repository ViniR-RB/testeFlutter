abstract class TodoState {}

class TodoLoadginState extends TodoState {}

class TodoLoadedState extends TodoState {}

class TodoErrorState extends TodoState {
  final String message;

  TodoErrorState(this.message);
}
