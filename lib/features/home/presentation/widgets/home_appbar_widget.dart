import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/core/core.dart';
import 'package:pago_facil_app/features/home/home.dart';

class HomeAppBarWidget extends AppBarWidget {
  final void Function()? openDrawer;
  HomeAppBarWidget({
    Key? key,
    this.openDrawer,
  }) : super(
          key: key,
          title: BlocBuilder<HomeCubit, HomeState>(
              builder: (BuildContext context, HomeState state) {
            if (state is HomeSuccess) {
              return Text(state.fullName);
            }
            return const Text("");
          }),
          leading: const Icon(Icons.person),
          actions: <Widget>[
            IconButton(
                padding: EdgeInsets.zero,
                icon: const Icon(Icons.menu),
                onPressed: openDrawer),
          ],
        );
}
