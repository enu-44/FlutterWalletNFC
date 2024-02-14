import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/presentation/widgets/expanded_section_widget.dart';

class ButtonMoreCardWidget extends StatelessWidget {
  const ButtonMoreCardWidget(
      {Key? key,
      required this.widget,
      this.textMore = 'Ver detalle',
      this.textLess = 'Cerrar detalle'})
      : super(key: key);
  final Widget widget;
  final String textMore;
  final String textLess;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildExpandSection(),
        Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
          child: _buildButtonExpand(context),
        ),
      ],
    );
  }

  Widget _buildExpandSection() => BlocBuilder<VisibilityState, bool>(
          builder: (BuildContext context, bool visibilityState) {
        return ExpandedSection(
          expand: visibilityState,
          child: Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: widget),
        );
      });

  Widget _buildButtonExpand(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: const Size(double.infinity, 30),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: () => context.read<VisibilityState>().changeVisibility(),
      child: BlocBuilder<VisibilityState, bool>(
          builder: (BuildContext context, bool state) {
        if (state == true) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_circle_up_rounded,
              ),
              Text(
                textLess,
                style: const TextStyle(fontWeight: FontWeight.normal),
              ),
            ],
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.arrow_circle_down_rounded,
              ),
              Text(
                textMore,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          );
        }
      }),
    );
  }
}

class VisibilityState extends Cubit<bool> {
  VisibilityState() : super(false);

  /// Method change status visibility
  void changeVisibility() => emit(!state);
  bool get value => state;
}
