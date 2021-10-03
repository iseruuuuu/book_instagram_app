// Flutter imports:
import 'package:book_instagram_app/repository/model/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:book_instagram_app/component/home/home_appbar.dart';
import 'package:book_instagram_app/component/home/home_profile.dart';
import 'package:book_instagram_app/repository/database/provider.dart';

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
                HomeProfileWidget(
                  count: snapshot.data?.length.toInt(),
                ),
                //TODO 後で実装（多分使わない？）
                //const HomeName(),
                //TODO 後で実装（多分使わない?);
                //const ProfileButton(),
                //TODO 後で実装
                //const HomeStory(),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: GridView.builder(
                      itemCount: snapshot.data?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                    ),
                  ),
                  //child: TodoPostItem(),
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
