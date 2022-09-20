import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_api_bloc/domain/models/game.dart';

import '../bloc/game_data_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameDataBloc, GameDataState>(
        builder: (context, state) {
          if (state is GameDataInitial) {
            context.read<GameDataBloc>().add(LoadGameDataEvent());
            return const Center(child: CircularProgressIndicator());
          } else if (state is GameDataLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GameDataErrorState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is GameDataLoadedState) {
            return _buildDataWidget(state.api_result);
          }

          return const Text("Erro");
        },
      ),
    );
  }
}

Widget _buildDataWidget(List<Game> apiResult) {
  return ListView.builder(
      itemCount: apiResult.length,
      itemBuilder: (BuildContext context, int index) {
        final Game game = apiResult[index];
        return Container(
          child: Column(
            children: [
              Text(game.title),
            ],
          ),
        );
      });
}
