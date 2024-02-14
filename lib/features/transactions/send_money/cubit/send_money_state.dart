abstract class SendMoneyState {
  SendMoneyState();
  factory SendMoneyState.initial() => _SendMoneyInitial();
  factory SendMoneyState.loading() => SendMoneyLoading();
  factory SendMoneyState.success() => SendMoneySuccess();
  factory SendMoneyState.failure() => SendMoneyFailure();
}

class _SendMoneyInitial extends SendMoneyState {}

class SendMoneyLoading extends SendMoneyState {}

class SendMoneySuccess extends SendMoneyState {}

class SendMoneyFailure extends SendMoneyState {}
