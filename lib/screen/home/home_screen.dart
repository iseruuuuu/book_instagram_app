import 'package:book_instagram_app/screen/home/children/home_appbar.dart';
import 'package:book_instagram_app/component/post_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'children/home_profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: const HomeAppBar(),
      body: Column(
        children: [
          const HomeProfileWidget(),
          //TODO 後で実装（多分使わない？）
          //const HomeName(),
          //TODO 後で実装（多分使わない?);
          //const ProfileButton(),
          //TODO 後で実装
          //const HomeStory(),
          Expanded(
            child: PostItem(),
          ),
        ],
      ),
    );
  }
}
