import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/devices/nfc_devices/nfc_devices.dart';
import 'package:pago_facil_app/features/devices/nfc_devices/presentation/widgets/nfc_device_card_widget.dart';

class NfcDevicesScreen extends StatelessWidget {
  const NfcDevicesScreen({super.key});

  void _cubitListener(
      BuildContext _, NfcDevicesState state, NfcDevicesCubit cubit) async {
    if (state is NfcDeviceStatusFailure) {
      CustomDialog.info(_,
          message:
              "Ocurrio un error al intentar cambiar de estado, vuelva a intentarlo");
    }
    if (state is NfcDeviceDeleteFailure) {
      CustomDialog.info(_,
          message:
              "Ocurrio un error al intentar eliminar el dispositivo, vuelva a intentarlo");
    }
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NfcDevicesCubit>();
    return BlocListener<NfcDevicesCubit, NfcDevicesState>(
      listener: (_, state) => _cubitListener(_, state, cubit),
      child: Scaffold(
        appBar: DefaultAppBarWidget(
          context: context,
          labelTitle: "Dispositivos",
          showBackButton: true,
        ),
        body: _buildContentBody(context, cubit),
        floatingActionButton: _buildAddBtn(context),
      ),
    );
  }

  Widget _buildContentBody(BuildContext _, NfcDevicesCubit cubit) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: BlocBuilder<NfcDevicesCubit, NfcDevicesState>(
          builder: (BuildContext context, NfcDevicesState state) {
        if (state is NfcDevicesLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is NfcDevicesEmpty) return const EmptyWidget();
        if (state is NfcDevicesSuccess ||
            state is NfcDeviceDeleteFailure ||
            state is NfcDeviceStatusFailure) {
          return _buildListDevicesWidget(state, cubit);
        }
        if (state is NfcDevicesFailure) {
          return const Center(
              child: Text("Ocurrio un error al cargar los dispositivos"));
        }
        return const Center(child: Text("No registra dispositivos"));
      }),
    );
  }

  Widget _buildAddBtn(BuildContext _) {
    return FloatingButtonWidget(
      onPress: () => Navigator.pushNamed(_, AppRoutes.nfcPairingDevice).then(
          (value) => value is bool ? _.read<NfcDevicesCubit>().load() : null),
      icon: Icons.add,
    );
  }

  Widget _buildListDevicesWidget(NfcDevicesState state, NfcDevicesCubit cubit) {
    return ListView.builder(
      itemCount: state.devices.length,
      itemBuilder: (BuildContext _, int index) => NfcDeviceCardWidget(
        nfc: state.devices[index],
        cubit: cubit,
      ),
    );
  }
}
