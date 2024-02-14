import 'package:flutter/material.dart';
import 'package:pago_facil_app/features/transactions/shared/widgets/common_form_widget.dart';

class NfcFormWidget extends StatelessWidget {
  const NfcFormWidget(
      {super.key,
      required this.accountNumberController,
      required this.userFullNameController});

  final TextEditingController accountNumberController;
  final TextEditingController userFullNameController;
  @override
  Widget build(BuildContext context) {
    return CommonFormWidget(
      accountNumberController: accountNumberController,
      userFullNameController: userFullNameController,
    );
  }
}
