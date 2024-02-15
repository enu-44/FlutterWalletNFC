import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/devices/nfc_devices/nfc_devices.dart';
import 'package:pago_facil_app/features/devices/nfc_devices/presentation/widgets/nfc_device_card_widget.dart';

class NfcDevicesScreen extends StatelessWidget {
  const NfcDevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        context: context,
        labelTitle: "Dispositivos",
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: BlocBuilder<NfcDevicesCubit, NfcDevicesState>(
            builder: (BuildContext context, NfcDevicesState state) {
          if (state is NfcDevicesLoading) {
            const CircularProgressIndicator();
          }
          if (state is NfcDevicesSuccess) {
            return _buildListDevicesWidget(state);
          }
          if (state is NfcDevicesFailure) {
            const Center(
                child: Text("Ocurrio un error al cargar los dispositivos"));
          }
          return const Center(child: Text("No registra dispositivos"));
        }),
      ),
      floatingActionButton: FloatingButtonWidget(
        onPress: () => Navigator.pushNamed(context, AppRoutes.nfcPairingDevice),
        icon: Icons.add,
      ),
    );
  }

  Widget _buildListDevicesWidget(NfcDevicesSuccess state) {
    return ListView.builder(
      itemCount: state.devices.length,
      itemBuilder: (BuildContext context, int index) {
        return NfcDeviceCardWidget(
            id: "qweqweasd453f",
            title: '#Dispositivo QASRTR12',
            enrollmentDate: DateTime.now(),
            isActive: index == 0 ? true : false);
      },
    );
  }
}
