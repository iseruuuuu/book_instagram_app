// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:book_instagram_app/repository/database/provider.dart';
import 'package:book_instagram_app/repository/model/model.dart';
import 'package:book_instagram_app/screen/todo_screen/todo_edit.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<TodoBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
      ),
      body: StreamBuilder<List<Todo>>(
        stream: _bloc.todoStream,
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                Todo todo = snapshot.data![index];
                return Dismissible(
                  key: Key(todo.id!),
                  //スライドで削除できる機能　＝＞左 => 右
                  background: _backgroundOfDismissible(),
                  //スライドで削除できる機能　 => 右 => 左
                  secondaryBackground: _secondaryBackgroundOfDismissible(),
                  onDismissed: (direction) {
                    _bloc.delete(todo.id!);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text("${todo.id}"),
                      subtitle: Text("${todo.title}"),
                      trailing: Text("${todo.note}"),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //登録画面に飛ぶ
          _moveToCreateView(context, _bloc);
        },
        child: const Icon(Icons.add, size: 40),
      ),
    );
  }

  _moveToEditView(BuildContext context, TodoBloc bloc, Todo todo) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          //todoBloc StreamController
          //todo Todoのデータ
          builder: (context) => TodoEditScreen(todoBloc: bloc, todo: todo),
        ),
      );

  _moveToCreateView(BuildContext context, TodoBloc bloc) => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              TodoEditScreen(todoBloc: bloc, todo: Todo.newTodo()),
        ),
      );

  _backgroundOfDismissible() => Container(
        alignment: Alignment.centerLeft,
        color: Colors.green,
        child: const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          child: Icon(Icons.done, color: Colors.white),
        ),
      );

  _secondaryBackgroundOfDismissible() => Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: Icon(Icons.done, color: Colors.white),
        ),
      );
}
