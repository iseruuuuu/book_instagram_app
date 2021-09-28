import 'package:book_instagram_app/screen/home/home_screen.dart';
import 'package:book_instagram_app/screen/register/register_screen.dart';
import 'package:book_instagram_app/screen/timeline/feed_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:book_instagram_app/screen/root/root_screen_state.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({
    Key? key,
  }) : super(key: key);

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
                child: const [
                  //画面を入れていく
                  FeedScreen(),
                  RegisterScreen(),
                  HomeScreen(),
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
                  size: 40.0,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.home,
                  size: 40.0,
                  color: Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_outlined,
                  size: 40.0,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.add_box_rounded,
                  size: 40.0,
                  color: Colors.black,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.person_outline,
                  size: 40.0,
                  color: Colors.black,
                ),
                activeIcon: Icon(
                  Icons.person,
                  size: 40.0,
                  color: Colors.black,
                ),
                title: Text(''),
              ),
            ],
          ),
        );
      },
    );
  }
}
