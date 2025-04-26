import '../../domain/repository/home_repository.dart';
import '../data_source/home_data_source.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource _homeDataSource;

  const HomeRepositoryImpl({
    required HomeDataSource homeDataSource,
  }) : _homeDataSource = homeDataSource;
}
