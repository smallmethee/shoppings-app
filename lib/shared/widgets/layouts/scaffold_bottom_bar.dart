import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shoppings_app/routers/routes.dart';
import 'package:shoppings_app/shared/widgets/animations/animated_branch_container.dart';

class ScaffoldBottomBar extends HookConsumerWidget {
  const ScaffoldBottomBar({
    super.key,
    required this.navigationShell,
    required this.children,
  });

  final StatefulNavigationShell navigationShell;
  final List<Widget> children;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: AnimatedBranchContainer(
        currentIndex: navigationShell.currentIndex,
        children: children,
      ),
      bottomNavigationBar: SizedBox(
        // height: 90,
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.stars),
              activeIcon: Icon(Icons.stars_rounded),
              label: 'Shopping',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.stars_outlined),
              activeIcon: Icon(Icons.stars_outlined),
              label: 'cart',
            ),
          ],
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            if (index == 1) {
              const CartScreenRoute().push(context);
            } else {
              navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              );
            }
          },
        ),
      ),
    );
  }
}
