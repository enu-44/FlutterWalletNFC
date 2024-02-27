import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/transactions/receive_money/receive_money.dart';

class ReceiveMoneyScreen extends StatelessWidget {
  const ReceiveMoneyScreen({super.key});
  void _cubitListener(
      BuildContext _, ReceivedMoneyState state, ReceiveMoneyCubit cubit) async {
    FocusScope.of(_).unfocus();
    if (state is ReceivedMoneyWalletInvalid || state is ReceivedMoneyFailure) {
      CustomDialog.info(_, message: state.message);
    }
    if (state is ReceivedMoneySuccess) {
      CustomDialog.info(_, message: state.message).then((value) =>
          Navigator.pushNamedAndRemoveUntil(_, AppRoutes.home, (_) => false));
    }
    if (state is ReceivedMoneyFailure) {
      cubit.emitState(ReceivedMoneyState.walletValid());
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReceiveMoneyCubit>();
    cubit.onValidateSupportNfc();
    return BlocListener<ReceiveMoneyCubit, ReceivedMoneyState>(
      listener: (_, state) => _cubitListener(_, state, cubit),
      child: BlocBuilder<ReceiveMoneyCubit, ReceivedMoneyState>(
        builder: (BuildContext _, ReceivedMoneyState state) {
          return _buildScafold(context, state, cubit);
        },
      ),
    );
  }

  Widget _buildScafold(BuildContext context, ReceivedMoneyState state,
          ReceiveMoneyCubit cubit) =>
      Scaffold(
        appBar: DefaultAppBarWidget(
          context: context,
          labelTitle: "Recibe Plata ",
          showBackButton: !cubit.isLoading(state),
        ),
        body: _buildContentBody(context, state, cubit),
        bottomNavigationBar: _buildNextButton(cubit, state, context),
      );

  Widget _buildContentBody(BuildContext context, ReceivedMoneyState state,
          ReceiveMoneyCubit cubit) =>
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            children: [
              AmountFormWidget(
                cubit: cubit,
                enabledInputs: state is ReceivedMoneyInitial,
              ),
              const SizedBox(
                height: 10.0,
              ),
              FutureBuilder(
                future: Future.value(true), //NfcUtils.isAvailable(),
                builder: (context, snapshot) {
                  if (snapshot.data == false) {
                    return state is ReceivedMoneyToReadNfc
                        ? const Center(child: UnsupportedNfcWidget())
                        : const SizedBox.shrink();
                  }
                  if (state is ReceivedMoneyInitial) {
                    return const SizedBox.shrink();
                  }
                  return ReceiveNfcFormWidget(cubit: cubit);
                },
              ),
              if (cubit.isLoading(state)) const CircularProgressIndicator()
            ],
          ),
        ),
      );

  Widget _buildNextButton(ReceiveMoneyCubit cubit, ReceivedMoneyState state,
          BuildContext context) =>
      SizedBox(
          height: kBottomNavigationBarHeight,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: ButtonWidget(
              text: cubit.isLoading(state) ? state.message : "Continuar",
              disabled: cubit.isLoading(state) ||
                  state is ReceivedMoneyWalletInvalid ||
                  state is ReceivedMoneyToReadNfc,
              icon: Icons.arrow_circle_right,
              onTap: () => _onNext(context, state),
            ),
          ));

  void _onNext(BuildContext context, ReceivedMoneyState state) {
    FocusScope.of(context).unfocus();
    final cubit = context.read<ReceiveMoneyCubit>();
    if (state is ReceivedMoneyWalletValid) _onConfirm(context, cubit);
    if (state is ReceivedMoneyInitial) _onFormAmountValidate(cubit);
    if (state is ReceivedMoneyWalletInvalid) cubit.onValidateWallet();
  }

  void _onFormAmountValidate(ReceiveMoneyCubit cubit) {
    if (!cubit.formReceiveAmountKey.currentState!.validate()) return;
    cubit.goReadToNfc();
  }

  Future<void> _onConfirm(BuildContext _, ReceiveMoneyCubit cubit) async {
    final bool result = await CustomDialog.confirm(_,
        message:
            'Confirmar cobro a ${cubit.fullNameCtrl.text} por ${MoneyFormatUtils.getMoneyFormat(value: double.parse(cubit.amountCtrl.text))}');
    if (result) cubit.onSendTransaction();
  }
}
