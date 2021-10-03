// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../../component/home/home_icon.dart';
import 'home_number.dart';

class HomeProfileWidget extends StatelessWidget {
  const HomeProfileWidget({
    Key? key,
    this.count,
  }) : super(key: key);

  final int? count;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: [
            Container(
              color: Colors.grey.shade200,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.white,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    title: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const HomeIcon(),
                          const SizedBox(),
                          HomeNumber(
                            count: count!,
                            title: '投稿数',
                          ),
                          const HomeNumber(
                            count: 1,
                            title: '日目',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
