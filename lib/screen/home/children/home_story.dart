import 'package:flutter/material.dart';

import 'bubble_stories.dart';

class HomeStory extends StatelessWidget {
  const HomeStory({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}