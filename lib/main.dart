import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/presentation/home_screen_root.dart';

void main() {
  runApp(ProviderScope(child: const HomeScreenRoot()));
}
