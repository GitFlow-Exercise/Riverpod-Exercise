import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/detail/presentation/detail_screen.dart';

class DetailScreenRoot extends ConsumerStatefulWidget {
  const DetailScreenRoot({super.key});

  @override
  ConsumerState<DetailScreenRoot> createState() => _DetailScreenRootState();
}

class _DetailScreenRootState extends ConsumerState<DetailScreenRoot> {
  @override
  Widget build(BuildContext context) {
    return const DetailScreen();
  }
}
