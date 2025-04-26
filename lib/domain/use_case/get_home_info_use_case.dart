import 'package:practice/domain/model/home.dart';
import 'package:practice/domain/repository/home_repository.dart';


class GetHomeInfoUseCase {
  final HomeRepository _repository;

  const GetHomeInfoUseCase(this._repository);

  Future<Home> getHomeInfo() async {
    return await _repository.getHomeInfo();
  }
}