import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:rxdart/rxdart.dart';

part 'root_screen_state.freezed.dart';

@freezed
class RootScreenState with _$RootScreenState {
  const factory RootScreenState() = _RootScreenState;
}

class RootScreenController extends StateNotifier<RootScreenState>
    with LocatorMixin {
  RootScreenController({
    required this.context,
  }) : super(const RootScreenState());

  final BuildContext context;
  final tabController = CupertinoTabController(initialIndex: 0);
  final subscription = CompositeSubscription();
  int currentIndex = 0;


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }
}
