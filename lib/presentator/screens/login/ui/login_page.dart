import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import '../../../blocs/login_bloc/login_bloc.dart';
import '../components/form_widget.dart';
import '../components/login_btn.dart';
import '../components/text_input_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late FocusNode emailFocus;
  late FocusNode passwordFocus;
  late FocusNode loginBtnFocus;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    emailFocus = FocusNode();
    passwordFocus = FocusNode();
    loginBtnFocus = FocusNode();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    loginBtnFocus.dispose();
    emailFocus.dispose();
    passwordFocus.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.red,
                content: Text(
                  'Digite um E-mail/Senha Válida',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          } else if (state is LoginLoadedState) {
            clearTextData();
            Navigator.of(context).pushNamed('/home', arguments: state.email);
          }
        },
        builder: (context, state) {
          if (state is LoginLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(child: _buildLoginScreen());
          }
        },
      ),
    );
  }

  Widget _buildLoginScreen() {
    return Stack(
      children: [
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 530,
            width: double.infinity,
            decoration: const BoxDecoration(color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset('assets/cybersecurity.json', height: 400),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 450,
          child: Container(
            height: MediaQuery.of(context).size.height - 670,
            width: MediaQuery.of(context).size.width - 40,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Colors.white, width: 1.5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.38),
                    spreadRadius: 5,
                    blurRadius: 15,
                  )
                ]),
            child: Padding(
              padding: const EdgeInsets.all(21.0),
              child: Column(
                children: [
                  buildFormWidget(
                    emailFocus: emailFocus,
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  LoginBtn(
                    email: emailController,
                    focusNode: loginBtnFocus,
                    password: passwordController,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  clearTextData() {
    emailController.clear();
    passwordController.clear();
  }
}
