import 'package:book_instagram_app/component/bottom_appbar.dart';
import 'package:book_instagram_app/component/bubble_stories.dart';
import 'package:book_instagram_app/component/home_name.dart';
import 'package:book_instagram_app/component/home_number.dart';
import 'package:book_instagram_app/component/post_item.dart';
import 'package:book_instagram_app/component/profile_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                ),
                const HomeNumber(),
                const HomeNumber(),
                const HomeNumber(),
              ],
            ),
          ),
          const HomeName(),
          const ProfileButton(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            child: SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  BubbleStories(text: 'story 1'),
                  BubbleStories(text: 'story 2'),
                  BubbleStories(text: 'story 3'),
                  BubbleStories(text: 'story 4'),
                  BubbleStories(text: 'story 5'),
                  BubbleStories(text: 'story 6'),
                  BubbleStories(text: 'story 7'),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
                child: PostItem(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomsAppBar(),
    );
  }
}
