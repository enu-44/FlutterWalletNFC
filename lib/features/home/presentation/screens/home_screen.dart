import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/available_balance/available_balance.dart';
import 'package:pago_facil_app/features/home/home.dart';
import 'package:pago_facil_app/features/movements/movements.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _drawerKey,
      appBar: HomeAppBarWidget(
        openDrawer: () {
          if (_drawerKey.currentState == null) return;
          if (_drawerKey.currentState!.isEndDrawerOpen) {
            _drawerKey.currentState?.openDrawer();
          } else {
            _drawerKey.currentState?.openEndDrawer();
          }
        },
      ),
      body: _buildBody(),
      endDrawer: DrawerWidget(
        children: _buildDrawerMenu(context),
      ),
      floatingActionButton: const HomeMenuWidget(),
    );
  }

  List<Widget> _buildDrawerMenu(BuildContext context) {
    return <Widget>[
      const SizedBox(height: 30.0),
      ListTile(
        leading: const Icon(Icons.settings),
        title: const Text("Configurar NFC"),
        onTap: () => Navigator.pushNamed(context, AppRoutes.nfcDevices),
      ),
      ListTile(
        leading: const Icon(Icons.logout),
        title: const Text("Cerrar Sesion"),
        onTap: () => Navigator.pushReplacementNamed(context, AppRoutes.splash),
      ),
    ];
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverDelegateWidget(
              const AvailableBalanceWidget(),
              SizeSliver(maxExtent: 55, minExtent: 55),
            ),
          ),
          const MovementsWidget(),
        ],
      ),
    );
  }
}
