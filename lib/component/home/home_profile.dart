// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:book_instagram_app/repository/preference/preference.dart';
import '../../../../component/home/home_icon.dart';
import 'home_number.dart';
import 'home_profile_state.dart';

class HomeProfileWidget extends StatelessWidget {
  const HomeProfileWidget({
    Key? key,
    this.count,
  }) : super(key: key);

  final int? count;

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<HomeProfileController, HomeProfileState>(
      create: (_) => HomeProfileController(
        context: context,
        preference: Preference(),
      ),
      builder: (context, _) {
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
                              HomeNumber(count: context.select<HomeProfileState, int>((state) => state.day),
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
      },
    );
  }
}
