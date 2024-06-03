class TranferFormModel {
  final String? amount;
  final String? pin;
  final String? sendTo;

  TranferFormModel({this.amount, this.pin, this.sendTo});

  TranferFormModel copyWith({
    String? amount,
    String? pin,
    String? sendTo,
  }) =>
      TranferFormModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        sendTo: sendTo ?? this.sendTo,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'pin': pin,
        'send_to': sendTo,
      };
}
