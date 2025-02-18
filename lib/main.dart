import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shoppings_app/routers/router.dart';
import 'package:shoppings_app/shared/domain/providers/theme_provider.dart';
import 'package:shoppings_app/shared/utils/state_logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(observers: [StateLogger()], child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return RefreshConfiguration(
        headerBuilder: () => const WaterDropHeader(),
        footerBuilder: () => const ClassicFooter(),
        headerTriggerDistance: 80.0,
        springDescription:
            const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
        maxOverScrollExtent: 100,
        maxUnderScrollExtent: 0,
        enableScrollWhenRefreshCompleted: true,
        enableLoadingWhenFailed: true,
        hideFooterWhenNotFull: false,
        enableBallisticLoad: true,
        child: MaterialApp.router(
          routerConfig: router,
          theme: ref.read(themeProvider),
        ));
  }
}
