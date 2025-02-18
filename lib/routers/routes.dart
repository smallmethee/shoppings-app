import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoppings_app/presentation/screens/cart_screen.dart';
import 'package:shoppings_app/presentation/screens/shopping_screen.dart';
import 'package:shoppings_app/shared/widgets/animations/page_slide.dart';
import 'package:shoppings_app/shared/widgets/layouts/scaffold_bottom_bar.dart';

part 'routes.g.dart';

@TypedStatefulShellRoute<MyShellRouteData>(
  branches: <TypedStatefulShellBranch<StatefulShellBranchData>>[
    TypedStatefulShellBranch<ShoppingBranchData>(
      routes: <TypedGoRoute<GoRouteData>>[
        TypedGoRoute<ShoppingScreenRoute>(
          path: '/shopping',
        ),
      ],
    ),
  ],
)
class MyShellRouteData extends StatefulShellRouteData {
  const MyShellRouteData();

  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return navigationShell;
  }

  static const String $restorationScopeId = 'restorationScopeId';

  static Widget $navigatorContainerBuilder(BuildContext context,
      StatefulNavigationShell navigationShell, List<Widget> children) {
    return ScaffoldBottomBar(
      navigationShell: navigationShell,
      children: children,
    );
  }
}

/// [shopping route]
class ShoppingBranchData extends StatefulShellBranchData {
  const ShoppingBranchData();
}

class ShoppingScreenRoute extends GoRouteData {
  const ShoppingScreenRoute();
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ShoppingScreen();
  }
}

/// [cart route]
@TypedGoRoute<CartScreenRoute>(
  path: '/cart',
)
class CartScreenRoute extends GoRouteData {
  const CartScreenRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return PageSlide(
      child: const CartScreen(),
    );
  }
}
