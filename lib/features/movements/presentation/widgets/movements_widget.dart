import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/movements/movements.dart';

class MovementsWidget extends StatelessWidget {
  const MovementsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<MovementsCubit, MovementsState>(
        builder: (BuildContext context, MovementsState state) {
      if (state is MovementsLoading) {
        return const SliverToBoxAdapter(
          child: Center(child: CircularProgressIndicator()),
        );
      }
      if (state is MovementsEmpty) {
        return SliverToBoxAdapter(
          child: EmptyWidget(height: size.height * 0.8),
        );
      }
      if (state is MovementsSuccess) {
        return SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return MovementCardWidget(movement: state.movements[index]);
          }, childCount: state.movements.length),
        );
      }
      if (state is MovementsFailure) {
        return const SliverToBoxAdapter(
          child:
              Center(child: Text("Ocurrio un error al cargar los movimientos")),
        );
      }
      return const SliverToBoxAdapter(
        child: Center(child: Text("No registra movimientos")),
      );
    });
  }
}
