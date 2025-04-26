import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/home/presentation/home_screen_root.dart';

void main() {
  // ProviderScope를 최상위 위젯으로 감싸 Riverpod 상태 관리 활성화
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 웹 MVI 예제',
      debugShowCheckedModeBanner: false,
      home: const HomeScreenRoot(),
    );
  }
}