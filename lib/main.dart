import 'package:flutter/material.dart';
import 'package:projeto_api_bloc/infra/service/api_service.dart';
import 'package:projeto_api_bloc/presentator/blocs/home_bloc/home_bloc.dart';
import 'package:projeto_api_bloc/presentator/blocs/login_bloc/login_bloc.dart';
import 'package:projeto_api_bloc/presentator/routes/app_routes.dart';
import 'package:projeto_api_bloc/presentator/screens/home/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentator/blocs/api_bloc/game_data_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameDataBloc>(
          create: (context) => GameDataBloc(ApiService()),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        onGenerateRoute: RouteGenerator().generateRoute,
      ),
    );
  }
}
