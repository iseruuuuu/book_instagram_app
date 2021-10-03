// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:book_instagram_app/component/home/home_appbar.dart';
import 'package:book_instagram_app/component/home/home_profile.dart';
import 'package:book_instagram_app/component/post_item.dart';
import 'package:book_instagram_app/repository/database/db_bloc.dart';
import 'package:book_instagram_app/repository/database/provider.dart';
import 'package:book_instagram_app/repository/model/model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _bloc = Provider.of<TodoBloc>(context, listen: false);
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

