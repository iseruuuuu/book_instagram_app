import 'dart:async';
import 'package:book_instagram_app/repository/model.dart';

class DBBloc {
  final _dBController = StreamController<List<Todo>>();

  Stream<List<Todo>> get DBstream => _dBController.stream;

  getDB() async {
    _dBController.sink.add(await DBProvider.db.getAllTodos());
  }

  DBBloc() {
    getDB();
  }

  dispose() {
    //多くのアプリケーションは1つのデータベースを使用し、データベースを閉じる必要はありません（アプリケーションが終了するとデータベースは閉じられます）。リソースを解放したい場合は、データベースを閉じることができます。
    _dBController.close();
  }

  create(Todo todo) {
    todo.assignUUID();
  }

}