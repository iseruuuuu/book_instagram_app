// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:book_instagram_app/repository/database/provider.dart';
import 'package:book_instagram_app/repository/model/model.dart';

class TodoPostItem extends StatelessWidget {
  const TodoPostItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<TodoBloc>(context, listen: false);
    return Scaffold(
      body: StreamBuilder<List<Todo>>(
        stream: _bloc.todoStream,
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              itemCount: snapshot.data?.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                Todo todo = snapshot.data![index];
                return Card(
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(todo.title.toString()),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: Text('まだ投稿されていません！'),
          );
        },
      ),
    );
  }
}
