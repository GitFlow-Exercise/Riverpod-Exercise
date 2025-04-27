import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/home/presentation/home_action.dart';

import 'home_event.dart';
import 'home_notifier.dart';
import 'home_screen.dart';

class HomeScreenRoot extends ConsumerStatefulWidget {
  final HomeNotifier notifier;

  const HomeScreenRoot({required this.notifier, super.key});

  @override
  ConsumerState<HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends ConsumerState<HomeScreenRoot> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    _subscription = widget.notifier.eventStream.listen(_handleEvent);

    // 화면이 처음 로드될 때 데이터 가져오기
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(homeNotifierProvider.notifier)
          .handleAction(const HomeAction.loadHomeInfo());
    });
  }

  // 1회성 이벤트 처리 메서드
  void _handleEvent(HomeEvent event) {
    switch (event) {
      case ShowSnackBar(message: final message):
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(message)));
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeNotifierProvider);

    return Scaffold(
      body: HomeScreen(state: state, onAction: widget.notifier.handleAction),
    );
  }
}
