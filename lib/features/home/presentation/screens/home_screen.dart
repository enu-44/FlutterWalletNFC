import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/wallet_balance/wallet_balance.dart';
import 'package:pago_facil_app/features/home/home.dart';
import 'package:pago_facil_app/features/movements/movements.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) return;
        _confirmAlertSignOut(context, context.read<HomeCubit>());
      },
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<MovementsCubit>().load();
          context.read<AvailableBalanceCubit>().load();
        },
        child: Scaffold(
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
          body: _buildBody(context),
          endDrawer: HomeDrawerMenu(cubit: context.read<HomeCubit>()),
          floatingActionButton: const HomeMenuWidget(),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: CustomScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
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

  Future<void> _confirmAlertSignOut(
      BuildContext context, HomeCubit cubit) async {
    final result = await CustomDialog.confirm(context,
        message: "¿Esta seguro que desea cerrar sesión?");
    if (!result) return;
    cubit.signOut().then((value) => Navigator.pushNamedAndRemoveUntil(
        context, AppRoutes.splash, (_) => false));
  }
}
