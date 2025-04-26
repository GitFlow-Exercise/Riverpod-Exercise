import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:practice/home/domain/model/home.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(false) bool isLoading,
    String? errorMessage,
    @Default(Home.empty) Home homeData,
  }) = _HomeState;
}
