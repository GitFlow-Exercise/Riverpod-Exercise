import 'dart:async';

import 'package:practice/core/di/providers.dart';
import 'package:practice/core/result/result.dart';
import 'package:practice/home/presentation/home_event.dart';
import 'package:practice/home/presentation/home_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_notifier.g.dart';

@riverpod
class HomeViewModel extends _$HomeNotifier {
  final _eventController = StreamController<HomeEvent>.broadcast();

  Stream<HomeEvent> get eventStream => _eventController.stream;

  @override
  HomeState build() {
    ref.onDispose(() {
      _eventController.close();
    });

    return const HomeState();
  }

  Future<void> loadHomeInfo() async {
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

  Future<void> refreshHomeInfo() async {
    await loadHomeInfo();
  }

  void emitEvent(HomeEvent event) {
    _eventController.add(event);
  }
}
