import '../../domain/model/home_model.dart';
import '../dto/home_dto.dart';

extension HomeMapper on HomeDto {
  Home toHome() {
    return Home();
  }
}
