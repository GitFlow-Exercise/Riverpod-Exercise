import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:practice/core/routing/router.dart';

void main() {
  // 경로 기반 URL 전략
  setUrlStrategy(PathUrlStrategy());

  runApp(const ProviderScope(child: PracticeApp()));
}

class PracticeApp extends ConsumerWidget {
  const PracticeApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}
