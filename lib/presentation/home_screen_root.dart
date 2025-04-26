import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/presentation/home_event.dart';
import 'package:practice/presentation/home_notifier.dart';
import 'package:practice/presentation/home_screen.dart';

class HomeScreenRoot extends ConsumerStatefulWidget {
  const HomeScreenRoot({super.key});

  @override
  ConsumerState<HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends ConsumerState<HomeScreenRoot> {
  late final StreamSubscription<HomeEvent> _eventSubscription;

  @override
  void initState() {
    super.initState();
    _eventSubscription = ref.read(homeNotifierProvider.notifier).eventStream.listen(_handleEvent);
  }

  void _handleEvent(HomeEvent event) {
    switch (event) {
      case ShowSnackBar():
        // TODO: Handle this case.
        throw UnimplementedError();
    }
  }

  @override
  void dispose() {
    _eventSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const HomeScreen();
  }
}