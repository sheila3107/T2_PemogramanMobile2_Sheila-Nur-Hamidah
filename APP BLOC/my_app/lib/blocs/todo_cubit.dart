import 'package:bloc/bloc.dart';
import '../models/todo_model.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title, String description, String priority) {
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
      description: description,
      date: DateTime.now(),
      priority: priority,
    );
    emit([...state, newTodo]);
  }

  void toggleTodo(String id) {
    emit(state.map((todo) {
      if (todo.id == id) {
        return todo.copyWith(isDone: !todo.isDone);
      }
      return todo;
    }).toList());
  }

  void removeTodo(String id) {
    emit(state.where((todo) => todo.id != id).toList());
  }
}