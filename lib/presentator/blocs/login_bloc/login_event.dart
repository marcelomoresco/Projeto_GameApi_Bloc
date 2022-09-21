part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginLoadedEvent extends LoginEvent {
  final String email;
  final String password;

  const LoginLoadedEvent(this.email, this.password);
}
