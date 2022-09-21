import 'package:flutter/material.dart';
import 'package:projeto_api_bloc/presentator/screens/login/components/text_input_login.dart';

class buildFormWidget extends StatelessWidget {
  const buildFormWidget({
    Key? key,
    required this.emailFocus,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final FocusNode emailFocus;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          InputField(
            obscureText: false,
            focusNode: emailFocus,
            label: 'E-mail',
            icons: const Icon(Icons.person, color: Colors.blue),
            textController: emailController,
          ),
          const SizedBox(
            height: 10,
          ),
          InputField(
            obscureText: true,
            focusNode: emailFocus,
            label: 'Senha',
            icons: const Icon(Icons.security, color: Colors.blue),
            textController: passwordController,
          ),
        ],
      ),
    );
  }
}
