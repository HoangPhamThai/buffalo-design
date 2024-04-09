import 'package:flutter/material.dart';

class BFAppBar extends StatefulWidget implements PreferredSizeWidget {
  const BFAppBar({
    super.key,
    this.withDefaultNavBack = false,
    this.navBackWidget,
    this.title,
    this.actions,
  });

  final bool withDefaultNavBack;
  final Widget? navBackWidget;
  final Widget? title;
  final List<Widget>? actions;

  @override
  State<BFAppBar> createState() => _BFAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

class _BFAppBarState extends State<BFAppBar> {
  Widget? renderLeading() {
    if (widget.withDefaultNavBack) {
      return widget.navBackWidget ??
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios));
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: renderLeading(),
      title: widget.title,
      actions: widget.actions,
    );
  }
}
