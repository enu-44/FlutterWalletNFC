import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/transactions/send_money/send_money.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  void _cubitListener(
      BuildContext _, SendMoneyState state, SendMoneyCubit cubit) async {
    FocusScope.of(_).unfocus();
    if (state is SendMoneyFailure || state is SendMoneyWalletInvalid) {
      CustomDialog.info(_, message: state.message);
    }
    if (state is SendMoneySuccess) {
      CustomDialog.info(_, message: state.message).then((value) =>
          Navigator.pushNamedAndRemoveUntil(_, AppRoutes.home, (_) => false));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SendMoneyCubit>();
    cubit.onValidateSupportNfc();
    return BlocListener<SendMoneyCubit, SendMoneyState>(
      listener: (_, state) => _cubitListener(_, state, cubit),
      child: Scaffold(
        appBar: DefaultAppBarWidget(
          showBackButton: true,
          context: context,
          labelTitle: "Envia Plata ",
        ),
        body: _buildContentBody(cubit),
        bottomNavigationBar: _buildNextButton(context, cubit),
      ),
    );
  }

  Widget _buildContentBody(SendMoneyCubit cubit) => TabBarWidget(
        onTabChanged: (int tabIndex) => cubit.tabIndex = tabIndex,
        tabTitles: const ["Leer NFC", "Ingresar Cuenta"],
        tabViews: [
          SingleChildScrollView(
            child: SendNfcFormWidget(
              cubit: cubit,
              formKey: cubit.formNfcKey,
            ),
          ),
          SingleChildScrollView(
            child: WalletFormWidget(
              cubit: cubit,
              formKey: cubit.formWalletKey,
              onValidate: () => cubit.onValidateWalletNumber(),
            ),
          )
        ],
      );

  Widget _buildNextButton(BuildContext _, SendMoneyCubit cubit) => SizedBox(
        height: kBottomNavigationBarHeight,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: BlocBuilder<SendMoneyCubit, SendMoneyState>(
            builder: (BuildContext _, SendMoneyState state) {
              return ButtonWidget(
                text: state is SendMoneyLoading ? state.message : "Continuar",
                disabled: state is! SendMoneyWalletValid &&
                    state is! SendMoneyFailure,
                icon: Icons.arrow_circle_right,
                onTap: () => _onNext(_, cubit),
              );
            },
          ),
        ),
      );

  Future<void> _onNext(BuildContext _, SendMoneyCubit cubit) async {
    FocusScope.of(_).unfocus();
    if (!cubit.isValidForm()) return;
    final bool result = await CustomDialog.confirm(_,
        message:
            'Confirmar envío a ${cubit.walletUserFullNameCtrl.text} por ${MoneyFormatUtils.getMoneyFormat(value: double.parse(cubit.amountCtrl.text))}');
    if (result) cubit.onSendTransaction();
  }
}
