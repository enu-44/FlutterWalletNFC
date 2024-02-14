import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class FloatingButtonWidget extends StatelessWidget {
  final IconData icon;
  final List<SpeedDialChild> children;
  final void Function()? onPress;
  const FloatingButtonWidget(
      {super.key,
      this.onPress,
      this.icon = Icons.add,
      this.children = const []});
  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      spacing: 3,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      curve: Curves.easeInOut,
      icon: icon,
      onPress: onPress,
      animatedIconTheme: const IconThemeData(size: 22.0),
      children: children,
    );
  }

  static Widget animated(
      {final AnimatedIconData icon = AnimatedIcons.home_menu,
      final List<SpeedDialChild> children = const []}) {
    return SpeedDial(
      spacing: 3,
      childPadding: const EdgeInsets.all(5),
      spaceBetweenChildren: 4,
      curve: Curves.easeInOut,
      animatedIcon: icon,
      animatedIconTheme: const IconThemeData(size: 22.0),
      children: children,
    );
  }
}
