part of 'operator_card_bloc.dart';

@immutable
sealed class OperatorCardState {}

final class OperatorCardInitial extends OperatorCardState {}

final class OperatorCardLoading extends OperatorCardState {}

final class OperatorCardFailed extends OperatorCardState {
  final String e;
  OperatorCardFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class OperatorCardSuccess extends OperatorCardState {
  final List<OperatorCardModel> operatorCards;

  OperatorCardSuccess(this.operatorCards);

  @override
  List<Object> get props => [operatorCards];
}
