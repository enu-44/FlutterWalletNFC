import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';

class TabBarWidget extends StatelessWidget {
  final List<String> tabTitles;
  final List<Widget> tabViews;
  final EdgeInsetsGeometry tabViewPadding;

  const TabBarWidget({
    super.key,
    required this.tabTitles,
    required this.tabViews,
    this.tabViewPadding =
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabTitles.length,
      child: Column(
        children: [
          Material(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              height: 50,
              color: Colors.white,
              child: TabBar(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                tabs: List.generate(
                  tabTitles.length,
                  (index) => Tab(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Palette.primary, width: 1),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(tabTitles[index]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: tabViewPadding,
              child: TabBarView(
                children: tabViews,
              ),
            ),
          )
        ],
      ),
    );
  }
}
