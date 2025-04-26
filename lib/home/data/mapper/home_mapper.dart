import 'package:practice/home/data/dto/home_dto.dart';
import 'package:practice/home/domain/model/home.dart';

extension HomeMapper on HomeDto {
  // DTO를 Domain Model로 변환하는 매퍼
  Home toHome() {
    return Home(title: title, description: description, imageUrl: imageUrl);
  }
}
