import 'dart:async';

import 'package:practice/core/di/providers.dart';
import 'package:practice/core/result/result.dart';
import 'package:practice/home/presentation/home_action.dart';
import 'package:practice/home/presentation/home_event.dart';
import 'package:practice/home/presentation/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeNotifier extends _$HomeNotifier {
  final _eventController = StreamController<HomeEvent>();

  Stream<HomeEvent> get eventStream => _eventController.stream;

  @override
  HomeState build() {
    ref.onDispose(() {
      _eventController.close();
    });

    return const HomeState();
  }

  Future<void> handleAction(HomeAction action) async {
    switch (action) {
      case LoadHomeInfo():
        await _loadHomeInfo();
      case Refresh():
        await _refreshHomeInfo();
      case OnTapDetail():
        _onTap();
    }
  }

  Future<void> _loadHomeInfo() async {
    state = state.copyWith(homeData: const AsyncValue.loading());

    final useCase = ref.read(getHomeInfoUseCaseProvider);
    final result = await useCase.getHomeInfo();

    state = state.copyWith(
      homeData: switch (result) {
        Success(data: final homeData) => AsyncValue.data(homeData),
        Error(error: final error) => AsyncValue.error(
          error,
          StackTrace.current,
        ),
      },
    );

    if (state.homeData is AsyncError) {
      final error = (state.homeData as AsyncError).error;
      emitEvent(HomeEvent.showSnackBar('정보를 불러오는데 실패했습니다: $error'));
    }
  }

  Future<void> _refreshHomeInfo() async {
    await _loadHomeInfo();
  }

  void _onTap() {
    emitEvent(const HomeEvent.showSnackBar('탭이 클릭되었습니다.'));
  }

  void emitEvent(HomeEvent event) {
    _eventController.add(event);
  }
}
