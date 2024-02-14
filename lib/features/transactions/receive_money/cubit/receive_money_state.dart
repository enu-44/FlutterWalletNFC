abstract class ReceivedMoneyState {
  ReceivedMoneyState();
  factory ReceivedMoneyState.initial() => _ReceivedMoneyInitial();
}

class _ReceivedMoneyInitial extends ReceivedMoneyState {}
