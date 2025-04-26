import 'package:practice/data/data_source/home_data_source.dart';
import 'package:practice/data/mapper/home_mapper.dart';
import 'package:practice/domain/model/home.dart';
import 'package:practice/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _homeDataSource;

  const HomeRepositoryImpl({required HomeDataSource homeDataSource})
    : _homeDataSource = homeDataSource;

  @override
  Future<Home> getHomeInfo() async {
    // 데이터 소스에서 DTO를 가져와 도메인 모델로 변환하여 반환
    final homeDto = await _homeDataSource.getHomeInfo();
    return homeDto.toHome();
  }
}
