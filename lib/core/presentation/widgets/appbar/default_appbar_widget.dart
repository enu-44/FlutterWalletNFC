import 'package:flutter/material.dart';
import 'package:pago_facil_app/core/presentation/widgets/appbar/base/appbar_widget.dart';

class DefaultAppBarWidget extends AppBarWidget {
  final BuildContext context;

  final String labelTitle;
  final bool showBackButton;
  final void Function()? onBackButton;

  DefaultAppBarWidget({
    Key? key,
    required this.labelTitle,
    required this.context,
    this.showBackButton = false,
    this.onBackButton,
  }) : super(
          key: key,
          title: Text(labelTitle),
          leading: showBackButton
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null,
        );
}
