// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:book_instagram_app/repository/model/db_bloc.dart';
import 'package:book_instagram_app/screen/root/root_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Provider<DBBloc>(
        create: (context) => DBBloc(),
        child: const RootScreen(),
      ),
    );
  }
}
