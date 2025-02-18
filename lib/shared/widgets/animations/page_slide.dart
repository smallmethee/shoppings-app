import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum SlideDirection {
  fromLeft,
  fromRight,
  fromTop,
  fromBottom,
}

class PageSlide<T> extends CustomTransitionPage<T> {
  PageSlide({
    super.key,
    super.opaque = false,
    super.barrierDismissible = true,
    required super.child,
    SlideDirection direction = SlideDirection.fromRight,
  }) : super(
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final offset = _getOffsetForDirection(direction);

            final primaryAnimation = Tween(begin: offset, end: Offset.zero)
                .chain(CurveTween(curve: Curves.easeInOut));

            final secondaryAnimationOffset =
                Tween(begin: Offset.zero, end: -offset * 0.05)
                    .chain(CurveTween(curve: Curves.easeInOut));

            return SlideTransition(
              position: animation.drive(primaryAnimation),
              child: SlideTransition(
                position: secondaryAnimation.drive(secondaryAnimationOffset),
                child: child,
              ),
            );
          },
        );

  static Offset _getOffsetForDirection(SlideDirection direction) {
    switch (direction) {
      case SlideDirection.fromLeft:
        return const Offset(-1.0, 0.0);
      case SlideDirection.fromRight:
        return const Offset(1.0, 0.0);
      case SlideDirection.fromTop:
        return const Offset(0.0, -1.0);
      case SlideDirection.fromBottom:
        return const Offset(0.0, 1.0);
    }
  }
}
