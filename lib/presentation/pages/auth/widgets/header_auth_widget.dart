import 'package:flutter/material.dart';

class HeaderAuthWidget extends StatelessWidget {
  const HeaderAuthWidget(
      {super.key,
      required this.title,
      this.pathLogo,
      this.margin = const EdgeInsets.only(bottom: 40.0, top: 40.0)});

  final String? pathLogo;
  final String title;
  final EdgeInsetsGeometry margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: margin,
      child: Column(
        children: [
          if (pathLogo != null) Image.asset(pathLogo!, width: 150, height: 150),
          if (pathLogo != null) const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          )
        ],
      ),
    );
  }
}
