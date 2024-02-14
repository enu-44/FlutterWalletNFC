import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/transactions/transactions.dart';

class ReceiveMoneyCubit extends Cubit<ReceivedMoneyState> {
  ReceiveMoneyCubit() : super(ReceivedMoneyState.initial());

  @override
  Future<void> close() {
    return super.close();
  }
}
