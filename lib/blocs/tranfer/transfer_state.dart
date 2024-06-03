part of 'transfer_bloc.dart';

@immutable
sealed class TransferState {}

final class TransferInitial extends TransferState {}

final class TransferLoading extends TransferState {}

final class TransferFailed extends TransferState {
  final String e;
  TransferFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class TransferSuccess extends TransferState {}
