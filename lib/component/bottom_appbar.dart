import 'package:book_instagram_app/screen/home/home_screen.dart';
import 'package:book_instagram_app/screen/timeline/feed_screen.dart';
import 'package:flutter/material.dart';

class BottomsAppBar extends StatelessWidget {
  const BottomsAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30.0),
        topRight: Radius.circular(30.0),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FeedScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.dashboard,
                size: 30.0,
                color: Colors.black,
              ),
            ),
            title: Text(''),
          ),
          BottomNavigationBarItem(
            icon: FlatButton(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              color: const Color(0xFF23B66F),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: const Icon(
                Icons.add,
                size: 30.0,
                color: Colors.white,
              ),
            ),
            title: const Text(''),
          ),
          BottomNavigationBarItem(
            icon: FlatButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: const Icon(
                Icons.person,
                size: 30.0,
                color: Colors.black,
              ),
            ),
            title: const Text(''),
          ),
        ],
      ),
    );
  }
}
