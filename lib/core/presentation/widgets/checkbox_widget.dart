import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/presentation/widgets/hyperlink_widget.dart';
import 'package:rxdart/rxdart.dart';

class CheckboxWidget extends StatefulWidget {
  const CheckboxWidget({super.key, required this.label, this.controller});
  final String label;
  final ValueNotifier<bool>? controller;

  @override
  State<CheckboxWidget> createState() => _CheckboxWidgetState();
}

class _CheckboxWidgetState extends State<CheckboxWidget> {
  late BehaviorSubject<bool> _checkSubject;
  Stream<bool> get checkStream => _checkSubject.stream;
  bool checkValue() => _checkSubject.value;

  @override
  void initState() {
    _checkSubject = BehaviorSubject<bool>.seeded(false);
    super.initState();
  }

  @override
  void dispose() {
    _checkSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        StreamBuilder<bool>(
            stream: checkStream,
            builder: (_, snapshot) {
              return Checkbox(
                value: snapshot.data ?? false,
                onChanged: (value) {
                  _checkSubject.add(value ?? false);
                  if (widget.controller != null) {
                    widget.controller!.value = value ?? false;
                  }
                },
              );
            }),
        HyperlinkWidget(
          title: widget.label,
        )
      ],
    );
  }
}
