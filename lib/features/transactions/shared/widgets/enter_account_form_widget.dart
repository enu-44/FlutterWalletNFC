import 'package:flutter/material.dart';
import 'package:pago_facil_app/features/transactions/shared/widgets/common_form_widget.dart';

class EnterAccountFormWidget extends StatelessWidget {
  const EnterAccountFormWidget(
      {super.key,
      required this.accountNumberController,
      required this.userFullNameController,
      this.onValidate});

  final TextEditingController accountNumberController;
  final TextEditingController userFullNameController;
  final void Function()? onValidate;

  @override
  Widget build(BuildContext context) {
    return CommonFormWidget(
      accountNumberController: accountNumberController,
      userFullNameController: userFullNameController,
      onTapBtnValidate: onValidate,
      showBtnValidate: true,
      enabledAccountNumber: true,
    );
  }
}
