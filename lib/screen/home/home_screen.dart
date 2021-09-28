import 'package:book_instagram_app/component/bottom_appbar.dart';
import 'package:book_instagram_app/screen/home/children/home_appbar.dart';
import 'package:book_instagram_app/screen/home/children/home_name.dart';
import 'package:book_instagram_app/screen/home/children/home_number.dart';
import 'package:book_instagram_app/component/post_item.dart';
import 'package:book_instagram_app/component/profile_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'children/home_icon.dart';
import 'children/home_story.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomeAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                HomeIcon(),
                HomeNumber(),
                HomeNumber(),
                HomeNumber(),
              ],
            ),
          ),
          const HomeName(),
          const ProfileButton(),
          const HomeStory(),
          Expanded(
            child: Container(
              color: Colors.white,
              child: PostItem(),
            ),
          ),
        ],
      ),
    );
  }
}
