import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pago_facil_app/presentation/theme/palette.dart';
import 'package:rxdart/rxdart.dart';

class InputWidget extends StatefulWidget {
  final TextEditingController? controller;
  @override
  final Key? key;
  final bool isPassword;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final TextInputType? inputType;
  final IconData? icons;
  final int? maxLines;

  const InputWidget({
    this.key,
    this.controller,
    this.isPassword = false,
    this.hintText,
    this.labelText,
    this.helperText,
    this.onSaved,
    this.validator,
    this.onFieldSubmitted,
    this.inputType,
    this.icons,
    this.maxLines = 1,
  }) : super(key: key);

  @override
  State<InputWidget> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<InputWidget> {
  late BehaviorSubject<bool> _oscureTextSubject;

  @override
  void initState() {
    super.initState();
    _oscureTextSubject = BehaviorSubject<bool>.seeded(widget.isPassword);
  }

  Stream<bool> get oscureTextStream => _oscureTextSubject.stream;
  bool oscureTextvalue() => _oscureTextSubject.value;
  @override
  void dispose() {
    _oscureTextSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: oscureTextStream,
        builder: (context, snapshot) {
          return TextFormField(
            cursorColor: Palette.bodyMedium,
            controller: widget.controller,
            keyboardType: widget.inputType,
            key: widget.key,
            obscureText: snapshot.data ?? false,
            onSaved: widget.onSaved,
            validator: widget.validator,
            onFieldSubmitted: widget.onFieldSubmitted,
            maxLines: widget.maxLines ?? 1,
            decoration: InputDecoration(
              labelText: widget.labelText,
              hintText: widget.hintText,
              suffixIcon: GestureDetector(
                  onTap: () => _oscureTextSubject.add(!oscureTextvalue()),
                  child: widget.isPassword == true
                      ? _createWidgetPassword(snapshot.data ?? false)
                      : Icon(widget.icons)
                  // CustomSurffixIcon(svgIcon: widget.iconString != null  ? icon.toString() : ''),
                  ),
            ),
          );
        });
  }

  Widget _createWidgetPassword(bool isOscureText) => Icon(
        isOscureText == false ? Icons.visibility : Icons.visibility_off,
        color:
            isOscureText == false ? Palette.inputIconActive : Palette.inputIcon,
      );
}
