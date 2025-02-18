import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  static const double _topBarHeight = 65;

  const TopBar(
      {super.key, this.title, this.onBackPressed, this.bottom, this.actions});
  final Widget? title;
  final VoidCallback? onBackPressed;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;

  @override
  Size get preferredSize => Size.fromHeight(
        _topBarHeight + (bottom?.preferredSize.height ?? 0),
      );

  Widget? _buildLeadingWidget(BuildContext context) {
    final ScaffoldState scaffold = Scaffold.of(context);
    final ModalRoute<Object?>? parentRoute = ModalRoute.of(context);

    final bool canPop = ModalRoute.of(context)?.canPop ?? false;
    final bool hasDrawer = scaffold.hasDrawer;
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    Widget? leading;
    if (hasDrawer) {
      leading = IconButton(
        icon: const Icon(Icons.menu_rounded, size: 24),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onPressed: Scaffold.of(context).openDrawer,
        tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
      );
    } else {
      if (canPop || onBackPressed != null) {
        if (useCloseButton) {
          leading = IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon:
                const Icon(Icons.close_rounded, color: Colors.black, size: 24),
            onPressed: onBackPressed ?? () => Navigator.of(context).maybePop(),
          );
        } else {
          leading = IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.arrow_back, color: Colors.black, size: 34),
            onPressed: onBackPressed ?? context.pop,
          );
        }
      }
    }

    return leading;
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
          toolbarHeight: _topBarHeight,
          title: title,
          centerTitle: false,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: actions,
          leading: _buildLeadingWidget(context),
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
          bottom: bottom),
    );
  }
}
