import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/devices/devices.dart';

class NfcDevicesPairingCubit extends Cubit<NfcDevicePairingState> {
  NfcDevicesPairingCubit() : super(NfcDevicePairingState.initial());
  final formKey = GlobalKey<FormState>();
  final deviceController = TextEditingController();
}
