// Flutter imports:
import 'package:book_instagram_app/repository/model/model.dart';
import 'package:book_instagram_app/screen/timeline_ful/todo_list_ful.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:book_instagram_app/screen/home/todo_less_home.dart';
import 'package:book_instagram_app/screen/root/root_screen_state.dart';
import 'package:book_instagram_app/screen/timeline/todo_list.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<RootScreenController, RootScreenState>(
      create: (_) => RootScreenController(
        context: context,
      ),
      builder: (context, _) {
        return CupertinoTabScaffold(
          controller: context.watch<RootScreenController>().tabController,
          tabBuilder: (context, index) {
            return CupertinoTabView(builder: (context) {
              return CupertinoPageScaffold(
                child: [
                  //book_instagram_app/screen/todo_screen/todo_list.dart
                  //TodoListScreen(),
                  TodoScreenFul(todo: Todo(),),
                  //book_instagram_app/screen/todo_less_home/todo_less_home.dart
                  TodoHomeScreen(),
                ][index],
              );
            });
          },
          tabBar: CupertinoTabBar(
            backgroundColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                  size: 35.0,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.home,
                  size: 35.0,
                  color: Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 35.0,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.person,
                  size: 35.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
