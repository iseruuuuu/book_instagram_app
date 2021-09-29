// Package imports:
import 'package:uuid/uuid.dart';

class Todo {
  // 登録したときに使うもの
  String? id;

  //記載した内容
  String? contents;

  //画像のパス
  String? imagePath;

  Todo({
    this.id,
    this.contents,
    this.imagePath,
  });

  Todo.newTodo() {
    contents = "";
    imagePath = "";
  }

  assignUUID() {
    id = const Uuid().v4();
  }

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
        id: json["id"],
        contents: json["contents"],
        imagePath: json["imagePath"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "contents": contents,
        "imagePath": imagePath,
      };
}
