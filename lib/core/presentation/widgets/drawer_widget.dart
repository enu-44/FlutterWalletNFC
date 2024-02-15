import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key, this.children = const <Widget>[]})
      : super(key: key);
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      key: const Key('DrawerPage'),
      child: ListView(padding: EdgeInsets.zero, children: children),
    );
  }
}
