import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:practice/core/routing/routes.dart';
import 'package:practice/detail/presentation/detail_screen_root.dart';
import 'package:practice/home/presentation/home_notifier.dart';
import 'package:practice/home/presentation/home_screen_root.dart';
import 'package:riverpod/riverpod.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: Routes.home,
    routes: [
      GoRoute(
        path: Routes.home,
        pageBuilder: (context, state) {
          final notifier = ref.read(homeNotifierProvider.notifier);
          return CustomTransitionPage(
            key: state.pageKey,
            child: HomeScreenRoot(notifier: notifier),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
                child: child,
              );
            },
            transitionDuration: const Duration(milliseconds: 100),
          );
        },
        routes: [
          GoRoute(
            path: Routes.detail,
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                key: state.pageKey,
                child: DetailScreenRoot(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOut,
                    ),
                    child: child,
                  );
                },
                transitionDuration: const Duration(milliseconds: 100),
              );
            },
          ),
        ],
      ),
    ],
  );
});
