import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/presentation/widgets/card/card_button_more_widget.dart';

class CardExpandWidget extends StatelessWidget {
  const CardExpandWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: <BlocProvider<dynamic>>[
        BlocProvider<VisibilityState>(
          create: (_) => VisibilityState(),
        ),
      ],
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
              minVerticalPadding: 0.0,
              leading: Icon(Icons.arrow_circle_up_rounded),
              title: Row(
                children: [
                  Expanded(child: Text('Jhoiner Samboni')),
                  Text('12/12/2023'),
                ],
              ),
              subtitle: Row(
                children: [
                  Expanded(child: Text('Envio Realizado')),
                  Text(
                    "\$100.000",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            CardButtonMoreWidget(
              widgets: [
                Text(
                  "Concepto",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("Pado de 1 libra de arroz, 1 Gaseosa")
              ],
            )
          ],
        ),
      ),
    );
  }
}
