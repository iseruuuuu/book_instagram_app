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
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.dashboard,
              size: 30.0,
              color: Colors.black,
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
              onPressed: () => print('Upload photo'),
              child: const Icon(
                Icons.add,
                size: 30.0,
                color: Colors.white,
              ),
            ),
            title: const Text(''),
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              size: 40.0,
              color: Colors.grey,
            ),
            title: Text(''),
          ),
        ],
      ),
    );
  }
}
