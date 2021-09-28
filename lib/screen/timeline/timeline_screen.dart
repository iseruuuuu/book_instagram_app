import 'package:book_instagram_app/screen/home/children/bubble_stories.dart';
import 'package:flutter/material.dart';
import '../../component/bottom_appbar.dart';
import 'children/timeline_post_widget.dart';

class TimeLineScreen extends StatefulWidget {
  const TimeLineScreen({Key? key}) : super(key: key);

  @override
  _TimeLineScreenState createState() => _TimeLineScreenState();
}

class _TimeLineScreenState extends State<TimeLineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF0F6),
      body: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Book Library',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.live_tv),
                      iconSize: 30,
                      onPressed: () {
                        print('IGTV');
                      },
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      width: 35,
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        iconSize: 30,
                        onPressed: () {
                          print('IGTV');
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
          const PostWidget(),
          const PostWidget(),
          const PostWidget(),
          const PostWidget(),
          const PostWidget(),
        ],
      ),
    );
  }
}