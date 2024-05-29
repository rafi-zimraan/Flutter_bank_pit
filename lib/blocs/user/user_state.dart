part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserFailed extends UserState {
  final String e;
  UserFailed(this.e);

  @override
  List<Object> get props => [e];
}

final class UserSuccess extends UserState {
  final List<UserModel> users;
  UserSuccess(this.users);

  @override
  List<Object> get props => [users];
}
