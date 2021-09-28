// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:book_instagram_app/component/post_item.dart';
import 'package:book_instagram_app/screen/home/children/profile/home_appbar.dart';
import 'children/profile/home_profile.dart';

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
