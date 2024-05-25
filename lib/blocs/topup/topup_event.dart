part of 'topup_bloc.dart';

@immutable
sealed class TopupEvent {}

class TopupPost extends TopupEvent {
  final TopupFormModel data;
  TopupPost(this.data);

  @override
  List<Object> get props => [data];
}
