import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:practice/home/presentation/home_state.dart';
import 'home_action.dart';
import 'home_notifier.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final state = ref.watch(homeNotifierProvider);

    final notifier = ref.read(homeNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 웹 홈'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => notifier.handleAction(const HomeAction.refresh()),
          ),
        ],
      ),
      body:
          state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : _buildContent(context, state, notifier),
    );
  }

  // 본문 컨텐츠 빌드
  Widget _buildContent(
    BuildContext context,
    HomeState state,
    HomeNotifier notifier,
  ) {
    // 에러 메시지가 있을 경우 에러 표시
    if (state.errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '에러 발생: ${state.errorMessage}',
              style: const TextStyle(color: Colors.red),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed:
                  () => notifier.handleAction(const HomeAction.refresh()),
              child: const Text('다시 시도'),
            ),
          ],
        ),
      );
    }

    // 데이터가 없을 경우 로딩 중 표시
    if (state.homeData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    // 화면 너비에 따라 레이아웃 조정 (반응형)
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWideScreen = constraints.maxWidth > 800;

        if (isWideScreen) {
          // 넓은 화면 레이아웃 (태블릿, 데스크톱)
          return _buildWideLayout(context, state, notifier);
        } else {
          // 좁은 화면 레이아웃 (모바일)
          return _buildNarrowLayout(context, state, notifier);
        }
      },
    );
  }

  // 넓은 화면용 레이아웃 (태블릿, 데스크톱)
  Widget _buildWideLayout(
    BuildContext context,
    HomeState state,
    HomeNotifier notifier,
  ) {
    return Row(
      children: [
        // 왼쪽 이미지 영역 (화면의 50%)
        Expanded(
          flex: 5,
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(32),
              child: Image.network(
                state.homeData!.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),

        // 오른쪽 텍스트 영역 (화면의 50%)
        Expanded(
          flex: 5,
          child: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.homeData!.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  state.homeData!.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed:
                      () => notifier.handleAction(const HomeAction.onTap()),
                  child: const Text('자세히 보기'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // 좁은 화면용 레이아웃 (모바일)
  Widget _buildNarrowLayout(
    BuildContext context,
    HomeState state,
    HomeNotifier notifier,
  ) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 상단 이미지 영역
          Container(
            padding: const EdgeInsets.all(16),
            child: Image.network(state.homeData!.imageUrl, fit: BoxFit.contain),
          ),

          // 하단 텍스트 영역
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.homeData!.title,
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text(
                  state.homeData!.description,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed:
                      () => notifier.handleAction(const HomeAction.onTap()),
                  child: const Text('자세히 보기'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
