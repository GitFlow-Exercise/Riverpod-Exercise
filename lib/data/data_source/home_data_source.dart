import 'package:practice/data/dto/home_dto.dart';

abstract interface class HomeDataSource {
  // 홈 정보를 가져오는 메서드
  Future<HomeDto> getHomeInfo();
}