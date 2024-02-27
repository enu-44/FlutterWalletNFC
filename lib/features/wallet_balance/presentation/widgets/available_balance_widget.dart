import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/wallet_balance/wallet_balance.dart';

class AvailableBalanceWidget extends StatelessWidget {
  const AvailableBalanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Palette.white,
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            "Disponible",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          BlocBuilder<AvailableBalanceCubit, AvailableBalanceState>(
              builder: (BuildContext context, AvailableBalanceState state) {
            if (state is AvailableBalanceSuccess) {
              return Text(
                MoneyFormatUtils.getMoneyFormat(value: state.availableBalance),
                style: Theme.of(context).textTheme.titleLarge,
              );
            }
            return const Text('---');
          })
        ],
      ),
    );
  }
}
