// Flutter imports:
import 'package:book_instagram_app/screen/add/todo_add.dart';
import 'package:book_instagram_app/screen/add/todo_edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:book_instagram_app/component/timeline/timeline_post_widget.dart';
import 'package:book_instagram_app/component/timeline/todo_appbar.dart';
import 'package:book_instagram_app/repository/database/provider.dart';
import 'package:book_instagram_app/repository/model/model.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<TodoBloc>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xFFEDF0F6),
      appBar: TodoAppBar(
        onTap: () {
          _moveToCreateView(context, _bloc);
        },
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
                  background: _backgroundOfDismissible(),
                  secondaryBackground: _secondaryBackgroundOfDismissible(),
                  onDismissed: (direction) {
                    _bloc.delete(todo.id!);
                  },
                  child: Card(
                    child: PostWidget(
                      contents: '${todo.note}',
                      imagePath: '${todo.title}',
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  _moveToEditView(BuildContext context, TodoBloc bloc, Todo todo) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          //builder: (context) => TodoEditScreen(todoBloc: bloc, todo: todo),
          builder: (context) => TodoAddScreen(todoBloc: bloc, todo: todo),
        ),
      );

  _moveToCreateView(BuildContext context, TodoBloc bloc) => Navigator.push(
        context,
        MaterialPageRoute(
            //builder: (context) =>TodoEditScreen(todoBloc: bloc, todo: Todo.newTodo()),
            builder: (context) =>
                TodoAddScreen(todoBloc: bloc, todo: Todo.newTodo()),
            fullscreenDialog: true),
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
