import 'package:flutter/material.dart';

class DropdownWidget<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final String labelText;
  final String? hintText;

  final String Function(T)? displayText;
  final void Function(T?)? onChanged;
  final TextEditingController? controller;

  const DropdownWidget({
    Key? key,
    required this.items,
    required this.labelText,
    this.hintText,
    this.value,
    this.displayText,
    this.onChanged,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DropdownMenu<T>(
      width: size.width * 0.9,
      initialSelection: value,
      controller: controller,
      requestFocusOnTap: true,
      label: Text(labelText),
      hintText: hintText,
      onSelected: (T? value) {
        FocusScope.of(context).unfocus();
        onChanged?.call(value);
      },
      dropdownMenuEntries: items.map<DropdownMenuEntry<T>>((T value) {
        return DropdownMenuEntry<T>(
          value: value,
          label: displayText?.call(value) ?? value.toString(),
        );
      }).toList(),
    );
  }
}
