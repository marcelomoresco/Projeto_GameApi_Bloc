import 'package:flutter/material.dart';
import 'package:projeto_api_bloc/domain/models/game.dart';
import 'package:projeto_api_bloc/infra/service/api_service.dart';
import 'package:projeto_api_bloc/presentator/bloc/game_data_bloc.dart';
import 'package:projeto_api_bloc/presentator/screens/home_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameDataBloc>(
      create: (context) => GameDataBloc(ApiService()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
