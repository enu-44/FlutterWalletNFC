import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pago_facil_app/features/home/home.dart';
import 'package:pago_facil_app/layers/layers.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._sessionRepository) : super(HomeState.initial());
  final ISessionRepository _sessionRepository;
  Future<void> load() async {
    final result = await _sessionRepository.getSignedIn();
    result.fold(
      (_) {},
      (_) => emit(HomeState.success(_.fullName)),
    );
  }

  Future<void> signOut() => _sessionRepository.signOut();
}
