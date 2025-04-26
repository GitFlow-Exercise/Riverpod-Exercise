import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  // 스낵바 표시 이벤트
  const factory HomeEvent.showSnackBar(String message) = ShowSnackBar;
}