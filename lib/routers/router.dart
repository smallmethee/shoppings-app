import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'routes.dart';

part 'router.g.dart';

final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

@riverpod
GoRouter router(Ref ref) {
  final router = GoRouter(
    navigatorKey: routerKey,
    initialLocation: const ShoppingScreenRoute().location,
    debugLogDiagnostics: kDebugMode,
    routes: $appRoutes,
  );

  ref.onDispose(router.dispose);

  return router;
}
