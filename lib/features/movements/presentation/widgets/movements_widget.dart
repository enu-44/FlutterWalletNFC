import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/movements/movements.dart';

class MovementsWidget extends StatelessWidget {
  const MovementsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovementsCubit, MovementsState>(
        builder: (BuildContext context, MovementsState state) {
      if (state is MovementsLoading) {
        const SliverToBoxAdapter(
          child: CircularProgressIndicator(),
        );
      }
      if (state is MovementsSuccess) {
        return SliverList(
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return MovementCardWidget(
              title: "Jhoiner Samboni",
              movementType: MovementType.envio,
              amount: 540,
              concept: "Prestamo",
              movementDate: DateTime.now().subtract(const Duration(hours: 48)),
              referencia: "WEAD12345",
            );
          }, childCount: state.movements.length),
        );
      }
      if (state is MovementsFailure) {
        const SliverToBoxAdapter(
          child:
              Center(child: Text("Ocurrio un error al cargar los moviemintos")),
        );
      }
      return const SliverToBoxAdapter(
        child: Center(child: Text("No registra movimientos")),
      );
    });
  }
}
