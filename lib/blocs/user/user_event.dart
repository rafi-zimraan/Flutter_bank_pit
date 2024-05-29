part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class UserGetByUsername extends UserEvent {
  final String username;
  UserGetByUsername(this.username);

  @override
  List<Object> get props => [username];
}

class UserGetRecent extends UserEvent {}
