import 'package:practice/core/exception/app_exception.dart';
import 'package:practice/core/result/result.dart';
import 'package:practice/home/domain/model/home.dart';
import 'package:practice/home/domain/repository/home_repository.dart';

class GetHomeInfoUseCase {
  final HomeRepository _repository;

  const GetHomeInfoUseCase(this._repository);

  Future<Result<Home, AppException>> getHomeInfo() async {
    return await _repository.getHomeInfo();
  }
}
