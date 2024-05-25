import 'package:bank_pit_bwa/models/payment_method_model.dart';
import 'package:bank_pit_bwa/services/payment_method_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'payment_menthod_event.dart';
part 'payment_menthod_state.dart';

class PaymentMenthodBloc
    extends Bloc<PaymentMenthodEvent, PaymentMenthodState> {
  PaymentMenthodBloc() : super(PaymentMenthodInitial()) {
    on<PaymentMenthodEvent>((event, emit) async {
      if (event is PaymentMethodGet) {
        try {
          emit(PaymentMenthodLoaing());

          final paymentMethods =
              await PaymentMethodService().getPaymentMethods();

          emit(PaymentMenthodSuccess(paymentMethods));
        } catch (e) {
          emit(PaymentMenthodFailed(e.toString()));
        }
      }
    });
  }
}
