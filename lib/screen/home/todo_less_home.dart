// Flutter imports:
import 'package:book_instagram_app/screen/add/todo_edit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:book_instagram_app/component/home/home_appbar.dart';
import 'package:book_instagram_app/component/home/home_profile.dart';
import 'package:book_instagram_app/repository/database/provider.dart';
import 'package:book_instagram_app/repository/model/model.dart';
import 'package:book_instagram_app/screen/detail/detail_screen.dart';

class TodoHomeScreen extends StatelessWidget {
  const TodoHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<TodoBloc>(context, listen: false);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const HomeAppBar(),
      body: StreamBuilder<List<Todo>>(
        stream: _bloc.todoStream,
        builder: (BuildContext context, AsyncSnapshot<List<Todo>> snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                HomeProfileWidget(count: snapshot.data?.length.toInt()),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: GridView.builder(
                      itemCount: snapshot.data?.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                      itemBuilder: (BuildContext context, int index) {
                        Todo todo = snapshot.data![index];
                        return GestureDetector(
                          //onTap: _moveToEditView(context,_bloc,todo),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DetailScreen(todoBloc: _bloc, todo: todo),
                              ),
                            );
                          },
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(todo.title.toString()),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }
}
