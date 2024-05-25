part of 'payment_menthod_bloc.dart';

@immutable
sealed class PaymentMenthodEvent {}

class PaymentMethodGet extends PaymentMenthodEvent {}


// abstract class PaymentMenthodEvent extends Equatable {
//    const PaymentMenthodEvent();


//    @override 
//    List<Object> extends PaymentMethodEvent
// }