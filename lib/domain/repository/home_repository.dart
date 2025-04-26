import 'package:practice/domain/model/home.dart';

abstract interface class HomeRepository {
  Future<Home> getHomeInfo();
}