// Dart imports:
import 'dart:async';

// Project imports:
import 'package:book_instagram_app/repository/model/model.dart';
import 'db_bloc.dart';
import 'package:rxdart/rxdart.dart';

class TodoBloc {
  final _todoController = BehaviorSubject<List<Todo>>();
  Stream<List<Todo>> get todoStream => _todoController.stream;

  getTodos() async {
    _todoController.sink.add(await DBProvider.db.getAllTodos());
  }

  TodoBloc() {
    getTodos();
  }

  dispose() {
    _todoController.close();
  }

  create(Todo todo) {
    todo.assignUUID();
    DBProvider.db.createTodo(todo);
    getTodos();
  }

  update(Todo todo) {
    DBProvider.db.updateTodo(todo);
    getTodos();
  }

  delete(String id) {
    DBProvider.db.deleteTodo(id);
    getTodos();
  }

  allDelete() {
    DBProvider.db.deleteAllTodo();
    getTodos();
  }
}
