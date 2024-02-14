import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/available_balance/available_balance.dart';

class AvailableBalanceCubit extends Cubit<AvailableBalanceState> {
  AvailableBalanceCubit() : super(AvailableBalanceState.initial());
  Future<void> load() async {
    emit(AvailableBalanceState.success(100000));
  }
}
