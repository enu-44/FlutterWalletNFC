import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/devices/devices.dart';
import 'package:pago_facil_app/features/transactions/transactions.dart';

class NfcPairingScreen extends StatelessWidget {
  const NfcPairingScreen({super.key});
  void _cubitListener(
      BuildContext _, NfcPairingState state, NfcPairingCubit cubit) async {
    if (state is NfcPairingFailure) {
      CustomDialog.info(_, message: state.message);
    }
    if (state is NfcPairingSuccess) {
      CustomDialog.info(_, message: state.message)
          .then((__) => Navigator.pop(_, true));
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NfcPairingCubit>();
    cubit.onValidateSupportNfc();
    return BlocListener<NfcPairingCubit, NfcPairingState>(
      listener: (_, state) => _cubitListener(_, state, cubit),
      child: _buildScaffold(context, cubit),
    );
  }

  Widget _buildScaffold(BuildContext context, NfcPairingCubit cubit) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        context: context,
        labelTitle: "Configurar NFC",
        showBackButton: true,
      ),
      body: _buildContentBody(context, cubit),
      bottomNavigationBar: _buildNextButton(cubit),
    );
  }

  Widget _buildContentBody(BuildContext context, NfcPairingCubit cubit) =>
      SharedNfcSupportWidget(
        buildContent: () => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: NfcPairingFormWidget(),
        ),
      );

  Widget _buildNextButton(NfcPairingCubit cubit) {
    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: BlocBuilder<NfcPairingCubit, NfcPairingState>(
          builder: (BuildContext _, NfcPairingState state) {
            return ButtonWidget(
              text: state is NfcPairingLoading ? state.message : "Continuar",
              disabled: _shouldDisabledBtn(state),
              icon: Icons.arrow_circle_right,
              onTap: () => cubit.onRegisterNfc(),
            );
          },
        ),
      ),
    );
  }

  bool _shouldDisabledBtn(NfcPairingState state) =>
      state is! NfcPairingReaded && state is! NfcPairingFailure;
}
