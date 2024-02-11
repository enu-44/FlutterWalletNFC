import 'package:flutter/material.dart';

class NoPageFoundScreen extends StatelessWidget {
  const NoPageFoundScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Page not found"),
      ),
    );
  }
}
