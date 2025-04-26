import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_action.freezed.dart';

@freezed
sealed class HomeAction with _$HomeAction {
  // 페이지 로드 시 데이터 가져오기 액션
  const factory HomeAction.loadHomeInfo() = LoadHomeInfo;

  // 버튼 클릭 시 새로고침 액션
  const factory HomeAction.refresh() = Refresh;

  // 탭 클릭 액션
  const factory HomeAction.onTapDetail() = OnTapDetail;
}
