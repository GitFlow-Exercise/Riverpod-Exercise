import 'dart:async';
import 'package:practice/presentation/home_action.dart';
import 'package:practice/presentation/home_event.dart';
import 'package:practice/presentation/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  final _eventController = StreamController<HomeEvent>.broadcast();
  Stream<HomeEvent> get eventStream => _eventController.stream;

  @override
  HomeState build() {
    ref.onDispose(() {
      _eventController.close();
    });

    return const HomeState();
  }

  void handleAction(HomeAction action) {

  }

  void _onTap() {
    // 구현
  }

  void emitEvent(HomeEvent event) {
    _eventController.add(event);
  }
}