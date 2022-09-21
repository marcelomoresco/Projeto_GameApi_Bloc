import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_api_bloc/infra/service/api_service.dart';
import '../blocs/api_bloc/game_data_bloc.dart';
import '../blocs/login_bloc/login_bloc.dart';
import '../screens/home/home_page.dart';
import '../screens/login/UI/login_page.dart';

class RouteGenerator {
  final LoginBloc _loginBloc = LoginBloc();
  final GameDataBloc _homeBloc = GameDataBloc(ApiService());

  Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginBloc>.value(
            value: _loginBloc,
            child: LoginPage(),
          ),
        );

      case '/home':
        if (args is String) {
          return MaterialPageRoute(
            builder: (_) => BlocProvider<GameDataBloc>.value(
              value: _homeBloc,
              child: HomePage(username: args),
            ),
          );
        }
        return _errorRoute();

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR IN NAVIGATION'),
        ),
      );
    });
  }
}
