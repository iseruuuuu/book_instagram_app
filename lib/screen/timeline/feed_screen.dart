import 'package:flutter/material.dart';
import '../../component/bottom_appbar.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
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
                    const SizedBox(width: 16,),
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
          const PostWidget(),
          const PostWidget(),
          const PostWidget(),
          const PostWidget(),
          const PostWidget(),
        ],
      ),
      bottomNavigationBar: const BottomsAppBar(),
    );
  }
}

class PostWidget extends StatelessWidget {
  const PostWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        width: double.infinity,
        height: 560,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        // child: Image(
                        //   height: 60,
                        //   width: 60,
                        //   image: AssetImage(storiers[index - 1]),
                        //   fit: BoxFit.cover,
                        // )
                        child: Icon(
                          Icons.accessibility,
                        ),
                      ),
                    ),
                    title: const Text(
                      // posts[0].authorName,
                      'Ryutaro Iseki',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // subtitle: Text(post[0].tomeAgo),
                    subtitle: const Text('明日の話題'),
                    trailing: IconButton(
                      icon: Icon(Icons.more_horiz),
                      color: Colors.black,
                      onPressed: () {
                        print('More');
                      },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    width: double.infinity,
                    height: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 5),
                          blurRadius: 8.0,
                        ),
                      ],
                      // image: DecrationImage(image: AssetImage(posts[0].imageUrl))
                      image: const DecorationImage(
                        image: AssetImage('assets/i.jpeg'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: [
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 30,
                                  icon: const Icon(Icons.favorite_border),
                                ),
                                const Text(
                                  '2,515',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      iconSize: 30,
                                      icon: const Icon(Icons.chat),
                                    ),
                                    const Text(
                                      '350',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          iconSize: 30,
                          icon: const Icon(Icons.bookmark_border),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
