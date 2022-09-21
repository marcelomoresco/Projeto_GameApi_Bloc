part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
  final String email;

  const LoginLoadedState(this.email);
}

class LoginErrorState extends LoginState {
  final String error;

  const LoginErrorState(this.error);
}
