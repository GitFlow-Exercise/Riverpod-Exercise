import 'dart:async';
import 'package:practice/core/di/providers.dart';
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
      case OnTap():
        _onTap();
    }
  }

  Future<void> _loadHomeInfo() async {
    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      final useCase = ref.read(getHomeInfoUseCaseProvider);
      final homeData = await useCase.getHomeInfo();

      state = state.copyWith(isLoading: false, homeData: homeData);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());

      emitEvent(HomeEvent.showSnackBar('정보를 불러오는데 실패했습니다: ${e.toString()}'));
    }
  }

  // 홈 정보 새로고침
  Future<void> _refreshHomeInfo() async {
    state = state.copyWith(isLoading: true);

    try {
      final useCase = ref.read(getHomeInfoUseCaseProvider);
      final homeData = await useCase.getHomeInfo();

      state = state.copyWith(isLoading: false, homeData: homeData);
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());

      emitEvent(HomeEvent.showSnackBar('새로고침 실패: ${e.toString()}'));
    }
  }

  // 탭 클릭 처리
  void _onTap() {
    emitEvent(const HomeEvent.showSnackBar('탭이 클릭되었습니다.'));
  }

  // 이벤트 발생 메서드
  void emitEvent(HomeEvent event) {
    _eventController.add(event);
  }
}
