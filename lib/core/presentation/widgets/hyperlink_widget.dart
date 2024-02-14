import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/theme/theme.dart';

class HyperlinkWidget extends StatefulWidget {
  const HyperlinkWidget({
    Key? key,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final void Function()? onTap;
  final String title;

  @override
  _HyperlinkWidgetState createState() => _HyperlinkWidgetState();
}

class _HyperlinkWidgetState extends State<HyperlinkWidget> {
  late StreamController<bool> _hoverStreamController;
  late Stream<bool> _hoverStream;

  @override
  void initState() {
    super.initState();
    _hoverStreamController = StreamController<bool>.broadcast();
    _hoverStream = _hoverStreamController.stream;
  }

  @override
  void dispose() {
    _hoverStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final baseStyle = FlutPagoFacilTheme.textTheme.linkMedium;
    final hoveredColor = Color.fromRGBO(
      baseStyle.color!.red,
      baseStyle.color!.green,
      baseStyle.color!.blue,
      0.7, // Reducir la opacidad al hacer clic
    );

    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) => _updateHover(true),
      onTapUp: (_) => _updateHover(false),
      onTapCancel: () => _updateHover(false),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: StreamBuilder<bool>(
          stream: _hoverStream,
          initialData: false,
          builder: (_, snapshot) {
            final isHovering = snapshot.data!;
            final style = baseStyle.copyWith(
              color: isHovering ? hoveredColor : baseStyle.color,
            );
            return Text(widget.title, style: style);
          },
        ),
      ),
    );
  }

  void _updateHover(bool isHovering) => _hoverStreamController.add(isHovering);
}
