import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginEvent>(
      (event, emit) async {
        if (event is LoginLoadedEvent) {
          //Validação de Email E Senha

          if (event.email.isEmpty || event.password.isEmpty) {
            emit(
              const LoginErrorState("Campo Obrigatório"),
            );
            //Validação de Email

          } else if (!event.email.contains('@')) {
            emit(
              const LoginErrorState("Seu E-mail deve ter @"),
            );

            //Passou

          } else {
            emit(
              LoginLoadedState(event.email),
            );
          }
        }
      },
    );
  }
}
