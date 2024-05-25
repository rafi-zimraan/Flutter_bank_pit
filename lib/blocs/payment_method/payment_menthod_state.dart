part of 'payment_menthod_bloc.dart';

@immutable
sealed class PaymentMenthodState {}

final class PaymentMenthodInitial extends PaymentMenthodState {}

final class PaymentMenthodLoaing extends PaymentMenthodState {}

final class PaymentMenthodFailed extends PaymentMenthodState {
  final String e;
  PaymentMenthodFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class PaymentMenthodSuccess extends PaymentMenthodState {
  final List<PaymentMethodModel> paymentMethods;
  PaymentMenthodSuccess(this.paymentMethods);

  @override
  List<Object> get props => [paymentMethods];
}
