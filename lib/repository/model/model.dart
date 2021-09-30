import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Todo {
  String? id;
  String? title;
  String? note;

  Todo({
    this.id,
    this.title,
    this.note,
  });

  Todo.newTodo() {
    title = "";
    note = "";
  }

  assignUUID() {
    id = const Uuid().v4();
  }

  factory Todo.fromMap(Map<String, dynamic> json) => Todo(
    id: json["id"],
    title: json["title"],
    note: json["note"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "note": note,
  };
}
