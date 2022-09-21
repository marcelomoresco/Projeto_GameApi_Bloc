import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../blocs/login_bloc/login_bloc.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn(
      {Key? key,
      required this.focusNode,
      required this.email,
      required this.password})
      : super(key: key);

  final FocusNode focusNode;
  final TextEditingController email;
  final TextEditingController password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.00),
      child: OutlinedButton(
        focusNode: focusNode,
        style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.blue, width: 1),
            minimumSize: const Size(double.infinity, 54),
            backgroundColor: Colors.blue[50]),
        onPressed: () {
          /*BlocProvider.of<LoginBloc>(context)
              .add(LoginLoadedEvent(email.text, password.text));*/

          context
              .read<LoginBloc>()
              .add(LoginLoadedEvent(email.text, password.text));
        },
        child: const Text(
          'Login',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
