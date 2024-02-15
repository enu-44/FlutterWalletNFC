import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/core.dart';

class TextareaWidget extends StatelessWidget {
  @override
  final Key? key;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final IconData? icons;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final TextEditingController? controller;

  const TextareaWidget(
      {this.key,
      this.controller,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.inputType,
      this.icons,
      this.focusNode,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InputWidget(
        inputType: TextInputType.text,
        controller: controller,
        isPassword: false,
        helperText: hintText,
        labelText: labelText,
        hintText: helperText,
        onSaved: onSaved,
        validator: validator,
        onFieldSubmitted: onFieldSubmitted,
        icons: icons,
        maxLines: 4,
        minLines: 2,
        focusNode: focusNode,
        onChanged: onChanged);
  }
}
