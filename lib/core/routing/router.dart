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
        builder: (context, state) {
          final notifier = ref.read(homeNotifierProvider.notifier);
          return HomeScreenRoot(notifier: notifier);
        },
        routes: [
          GoRoute(
            path: Routes.detail,
            builder: (context, state) => const DetailScreenRoot(),
          ),
        ],
      ),
    ],
  );
});
