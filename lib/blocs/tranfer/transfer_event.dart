part of 'transfer_bloc.dart';

@immutable
sealed class TransferEvent {}

class TransferPost extends TransferEvent {
  final TranferFormModel data;
  TransferPost(this.data);

  @override
  List<Object> get props => [data];
}
