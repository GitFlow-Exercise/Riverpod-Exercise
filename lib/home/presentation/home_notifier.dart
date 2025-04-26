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
  final _eventController = StreamController<HomeEvent>.broadcast();

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
    state = state.copyWith(isLoading: true, errorMessage: null);

    final useCase = ref.read(getHomeInfoUseCaseProvider);
    final result = await useCase.getHomeInfo();

    switch (result) {
      case Success(data: final homeData):
        state = state.copyWith(isLoading: false, homeData: homeData);
      case Error(error: final error):
        state = state.copyWith(isLoading: false, errorMessage: error.toString());
        emitEvent(HomeEvent.showSnackBar('정보를 불러오는데 실패했습니다: ${error.toString()}'));
    }
  }

  // 홈 정보 새로고침
  Future<void> _refreshHomeInfo() async {
    state = state.copyWith(isLoading: true);

    final useCase = ref.read(getHomeInfoUseCaseProvider);
    final result = await useCase.getHomeInfo();

    switch (result) {
      case Success(data: final homeData):
        state = state.copyWith(isLoading: false, homeData: homeData);
      case Error(error: final error):
        state = state.copyWith(isLoading: false, errorMessage: error.toString());
        emitEvent(HomeEvent.showSnackBar('새로고침 실패: ${error.toString()}'));
    }
  }

  void _onTap() {
    emitEvent(const HomeEvent.showSnackBar('탭이 클릭되었습니다.'));
  }

  void emitEvent(HomeEvent event) {
    _eventController.add(event);
  }
}