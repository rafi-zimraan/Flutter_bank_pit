part of 'topup_bloc.dart';

@immutable
sealed class TopupState {}

final class TopupInitial extends TopupState {}

final class TopupLoading extends TopupState {}

final class TopupFailed extends TopupState {
  final String e;
  TopupFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class TopupSuccess extends TopupState {
  final String redirectUrl;
  TopupSuccess(this.redirectUrl);

  @override
  List<Object> get props => [redirectUrl];
}
