part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class InitialEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class loginEvent extends AuthEvent {
  UserModel user;
  loginEvent( this.user);
}


