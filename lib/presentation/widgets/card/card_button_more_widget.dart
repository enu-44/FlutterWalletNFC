import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/presentation/theme/palette.dart';
import 'package:pago_facil_app/presentation/widgets/expanded_section_widget.dart';

class CardButtonMoreWidget extends StatelessWidget {
  const CardButtonMoreWidget(
      {Key? key,
      required this.widgets,
      this.textButtonMore = 'Ver detalle',
      this.textButtonLess = 'Cerrar detalle'})
      : super(key: key);
  final List<Widget> widgets;
  final String textButtonMore;
  final String textButtonLess;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _createExpandSection(),
        _buttonExpand(context),
      ],
    );
  }

  Widget _createExpandSection() => BlocBuilder<VisibilityState, bool>(
          builder: (BuildContext context, bool visibilityState) {
        return ExpandedSection(
          expand: visibilityState,
          child: _createSections(),
        );
      });

  Widget _createSections() => Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, children: widgets));

  Widget _buttonExpand(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
        decoration: const BoxDecoration(
          color: Palette.primary,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        child: BlocBuilder<VisibilityState, bool>(
            builder: (BuildContext context, bool state) {
          if (state == true) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                ),
                Text(textButtonLess,
                    style: const TextStyle(color: Palette.white)),
              ],
            );
          } else {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.arrow_downward,
                  color: Colors.white,
                ),
                Text(textButtonMore,
                    style: const TextStyle(color: Palette.white)),
              ],
            );
          }
        }),
      ),
      onTap: () {
        context.read<VisibilityState>().changeVisibility();
      },
    );
  }
}

class VisibilityState extends Cubit<bool> {
  VisibilityState() : super(false);

  /// Method change status visibility
  void changeVisibility() => emit(!state);
  bool get value => state;
}
