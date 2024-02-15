import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';

class TabBarWidget extends StatefulWidget {
  final List<String> tabTitles;
  final List<Widget> tabViews;
  final EdgeInsetsGeometry tabViewPadding;
  final Function(int)? onTabChanged;

  const TabBarWidget({
    Key? key,
    required this.tabTitles,
    required this.tabViews,
    this.tabViewPadding =
        const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    this.onTabChanged,
  }) : super(key: key);

  @override
  _TabBarWidgetState createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.tabTitles.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    int tabIndex = _tabController.index;
    if (widget.onTabChanged != null) {
      widget.onTabChanged!(tabIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabTitles.length,
      child: Column(
        children: [
          Material(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              height: 50,
              color: Colors.white,
              child: TabBar(
                controller: _tabController, // Usar el controlador TabController
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                tabs: List.generate(
                  widget.tabTitles.length,
                  (index) => Tab(
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(color: Palette.primary, width: 1),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(widget.tabTitles[index]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: widget.tabViewPadding,
              child: TabBarView(
                controller: _tabController,
                children: widget.tabViews,
              ),
            ),
          )
        ],
      ),
    );
  }
}
