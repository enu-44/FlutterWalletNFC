import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/transactions/receive_money/receive_money.dart';
import 'package:pago_facil_app/features/transactions/shared/shared.dart';

class ReceiveMoneyScreen extends StatelessWidget {
  const ReceiveMoneyScreen({super.key});

  _cubitListener(BuildContext _, ReceivedMoneyState state) async {
    final cubit = _.read<ReceiveMoneyCubit>();

    if (state is ReceivedMoneyToReadNfc) cubit.validateNfc();
    if (state is ReceivedMoneyErrorNfc) {
      AlertDialogCustom.info(_, title: 'Notificacion', message: state.message);
    }
    if (state is ReceivedMoneySuccess) {
      await AlertDialogCustom.info(_,
          title: 'Notificacion', message: state.message);
      if (!_.mounted) return;
      Navigator.pushReplacementNamed(_, AppRoutes.home);
    }
    if (state is ReceivedMoneyFailure) {
      await AlertDialogCustom.info(_,
          title: 'Notificacion', message: state.message);
      cubit.emitState(ReceivedMoneyState.successNfc());
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReceiveMoneyCubit>();
    return BlocListener<ReceiveMoneyCubit, ReceivedMoneyState>(
        listener: (_, state) => _cubitListener(_, state),
        child: BlocBuilder<ReceiveMoneyCubit, ReceivedMoneyState>(
            builder: (BuildContext _, ReceivedMoneyState state) {
          return Scaffold(
            appBar: DefaultAppBarWidget(
              context: context,
              labelTitle: "Recibe Plata ",
              showBackButton: !isLoading(state),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 15.0),
                child: Column(
                  children: [
                    _buildAmountFormWidget(cubit),
                    _buildNfcFormWidget(cubit, state),
                    if (isLoading(state)) const CircularProgressIndicator()
                  ],
                ),
              ),
            ),
            bottomNavigationBar: _buildNextButtonWidget(state, context),
          );
        }));
  }

  bool isLoading(ReceivedMoneyState state) =>
      (state is ReceivedMoneyValidatingNfc || state is ReceivedMoneyLoading);

  Widget _buildNextButtonWidget(
      ReceivedMoneyState state, BuildContext context) {
    return SizedBox(
        height: kBottomNavigationBarHeight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: ButtonWidget(
            text: isLoading(state) ? state.message : "Continuar",
            disabled: state is ReceivedMoneyLoading ||
                state is ReceivedMoneyValidatingNfc,
            icon: Icons.arrow_circle_right,
            onTap: () => _onTapNext(context, state),
          ),
        ));
  }

  Widget _buildAmountFormWidget(ReceiveMoneyCubit cubit) {
    return Form(
      key: cubit.formReceiveAmountKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: TransactionFormWidget(
        amountController: cubit.ammountController,
        conceptController: cubit.conceptController,
      ),
    );
  }

  Widget _buildNfcFormWidget(
      ReceiveMoneyCubit cubit, ReceivedMoneyState state) {
    if (state is ReceivedMoneyToReadNfc ||
        state is ReceivedMoneySuccessNfc ||
        state is ReceivedMoneyErrorNfc ||
        state is ReceivedMoneyFailure ||
        isLoading(state)) {
      return Form(
        key: cubit.formReceiveNfcKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: NfcFormWidget(
          accountNumberController: cubit.accountNumberController,
          userFullNameController: cubit.accountFullNameController,
        ),
      );
    }
    return const SizedBox.shrink();
  }

  Future<void> _onTapNext(
      BuildContext context, ReceivedMoneyState state) async {
    FocusScope.of(context).unfocus();
    final cubit = context.read<ReceiveMoneyCubit>();
    if (state is ReceivedMoneySuccessNfc) _handleConfirm(context, cubit);
    if (state is ReceivedMoneyInitial) _handleFormAmountValidate(cubit);
    if (state is ReceivedMoneyErrorNfc) cubit.validateNfc();
  }

  void _handleFormAmountValidate(ReceiveMoneyCubit cubit) async {
    if (!cubit.formReceiveAmountKey.currentState!.validate()) return;
    cubit.goReadToNfc();
  }

  Future<void> _handleConfirm(BuildContext _, ReceiveMoneyCubit cubit) async {
    final bool result = await AlertDialogCustom.confirm(_,
        title: 'Confirmar',
        message:
            'Confirmar cobro a ${cubit.accountFullNameController.text} por ${MoneyFormatUtils.getMoneyFormat(value: double.parse(cubit.ammountController.text))}');
    if (result) cubit.sendTransaction();
  }
}
