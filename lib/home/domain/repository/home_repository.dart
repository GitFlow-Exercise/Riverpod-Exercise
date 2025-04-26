import 'package:practice/core/result/result.dart';
import 'package:practice/core/exception/app_exception.dart';
import 'package:practice/home/domain/model/home.dart';

abstract interface class HomeRepository {
  Future<Result<Home, AppException>> getHomeInfo();
}