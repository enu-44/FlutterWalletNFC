import 'package:flutter/material.dart';

class SliverDelegateWidget extends SliverPersistentHeaderDelegate {
  SliverDelegateWidget(this.widget, this.sizeSliver);
  final Widget widget;
  final SizeSliver sizeSliver;
  @override
  double get minExtent => sizeSliver.minExtent;
  @override
  double get maxExtent => sizeSliver.maxExtent;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Center(child: widget);
  }

  @override
  bool shouldRebuild(SliverDelegateWidget oldDelegate) {
    return true;
  }
}

class SizeSliver {
  SizeSliver({this.maxExtent = 60, this.minExtent = 60});
  double minExtent;
  double maxExtent;
}
