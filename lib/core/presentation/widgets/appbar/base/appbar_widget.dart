import 'package:flutter/material.dart';

abstract class AppBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget title;
  final Widget? leading;
  final List<Widget>? actions;
  @override
  final Size preferredSize;
  const AppBarWidget(
      {Key? key,
      required this.title,
      this.leading,
      this.actions,
      this.preferredSize = const Size.fromHeight(kToolbarHeight)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: false,
      leading: leading,
      actions: actions,
    );
  }
}
