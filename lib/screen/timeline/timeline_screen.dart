// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:book_instagram_app/repository/model.dart';
import 'package:book_instagram_app/repository/model.dart';
import 'package:book_instagram_app/repository/model/db_bloc.dart';
import 'package:book_instagram_app/repository/model/provider.dart';
import 'children/timeline_post_widget.dart';

class TimeLineScreen extends StatefulWidget {
  const TimeLineScreen({Key? key}) : super(key: key);

  @override
  _TimeLineScreenState createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {
  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<TodoBloc>(context, listen: false);
    return Scaffold(
      backgroundColor: const Color(0xFFEDF0F6),
      body: StreamBuilder<List<Todo>>(
        stream: _bloc.todoStream,
        //AsyncSnapshotとは、非同期計算との最新の相互作用の不変表現。
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
                    //todo_blocから削除するメソッドを呼ぶ
                    _bloc.delete(todo.id!);
                  },
                  child: Card(
                    child: PostWidget(
                      contents: '${todo.contents}',
                      imagePath: '${todo.imagePath}',
                    ),
                  ),
                );
              },
            );
          }
          //return const Center(child: CircularProgressIndicator());
          return Container();
        },
      ),
    );
  }
}

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
