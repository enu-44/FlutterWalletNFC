import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/transactions/recharge_balance/recharge_balance.dart';

class RechargeBalanceWidget extends StatelessWidget {
  const RechargeBalanceWidget({super.key});

  void _cubitListener(BuildContext _, RechargeBalanceState state,
      RechargeBalanceCubit cubit) async {
    if (state is RechargeBalanceFailure) {
      CustomDialog.info(_, message: state.message);
    }
    if (state is RechargeBalanceSuccess) {
      CustomDialog.info(_, message: state.message).then((value) =>
          Navigator.pushNamedAndRemoveUntil(_, AppRoutes.home, (_) => false));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RechargeBalanceCubit>();
    return BlocListener<RechargeBalanceCubit, RechargeBalanceState>(
      listener: (_, state) => _cubitListener(_, state, cubit),
      child: Scaffold(
        appBar: DefaultAppBarWidget(
          context: context,
          labelTitle: "Recarga tu cuenta ",
          showBackButton: true,
        ),
        body: _buildContentBody(),
        bottomNavigationBar: _buildButton(context, cubit),
      ),
    );
  }

  Widget _buildButton(BuildContext _, RechargeBalanceCubit cubit) => SizedBox(
        height: kBottomNavigationBarHeight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: BlocBuilder<RechargeBalanceCubit, RechargeBalanceState>(
            builder: (BuildContext _, RechargeBalanceState state) {
              return ButtonWidget(
                text: state is RechargeBalanceLoading
                    ? state.message
                    : "Continuar",
                disabled: state is RechargeBalanceLoading,
                icon: Icons.arrow_circle_right,
                onTap: () => _onNext(_, cubit),
              );
            },
          ),
        ),
      );

  Widget _buildContentBody() => const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: RechargeFormWidget(),
        ),
      );

  Future<void> _onNext(BuildContext _, RechargeBalanceCubit cubit) async {
    if (!cubit.isValidForm()) return;
    _onConfirm(_, cubit);
  }

  Future<void> _onConfirm(BuildContext _, RechargeBalanceCubit cubit) async {
    final bool result = await CustomDialog.confirm(_,
        message:
            'Confirmar recarga desde ${cubit.bankCtrl.text} por ${MoneyFormatUtils.getMoneyFormat(value: double.parse(cubit.amountCtrl.text))}');
    if (result) cubit.onRecharge();
  }
}
