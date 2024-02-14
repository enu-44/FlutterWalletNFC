import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/presentation/widgets/card/card_expand/button_more_card_widget.dart';
import 'package:pago_facil_app/core/presentation/widgets/card/card_widget.dart';

class ExpandCardWidget extends StatelessWidget {
  const ExpandCardWidget(
      {super.key,
      required this.childExpand,
      this.title,
      this.subtitle,
      this.trailing,
      this.leading,
      this.contentPadding =
          const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0)});

  final Widget childExpand;
  final Widget? title;
  final Widget? subtitle;
  final Widget? trailing;
  final Widget? leading;
  final EdgeInsetsGeometry contentPadding;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<VisibilityState>(
          create: (_) => VisibilityState(),
        ),
      ],
      child: CardWidget(
        leading: leading,
        trailing: trailing,
        title: title,
        subtitle: subtitle,
        child: ButtonMoreCardWidget(
          widget: childExpand,
        ),
      ),
    );
  }
}
