import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget(
      {super.key,
      this.title,
      this.subtitle,
      this.trailing,
      this.child,
      this.leading,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0)});

  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final Widget? child;
  final Widget? leading;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            contentPadding: contentPadding,
            minVerticalPadding: 0.0,
            leading: leading,
            title: title,
            subtitle: subtitle,
            trailing: trailing,
          ),
          if (child != null) child!
        ],
      ),
    );
  }
}
