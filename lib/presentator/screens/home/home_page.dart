import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:projeto_api_bloc/domain/models/game.dart';

import '../../blocs/api_bloc/game_data_bloc.dart';
import '../../blocs/home_bloc/home_bloc.dart';
import 'components/header_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.username});

  final String username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameDataBloc, GameDataState>(
        builder: (context, state) {
          if (state is GameDataInitial) {
            //BlocProvider do Main
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
            return _buildHomeScreen(
              apiResult: state.api_result,
              username: username,
            );
          } else if (state is HomeNav) {
            Navigator.pop(context);
          }

          return const Text("Erro");
        },
      ),
    );
  }
}

Widget _buildHomeScreen(
    {required List<Game> apiResult, required String username}) {
  return Padding(
    padding: const EdgeInsets.all(25.0),
    child: Column(
      children: [
        headerHomeWidget(username: username),
        const SizedBox(
          height: 20,
        ),
        _buildDataWidget(apiResult: apiResult),
      ],
    ),
  );
}

Widget _buildDataWidget({
  required List<Game> apiResult,
}) {
  return Expanded(
    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.zero,
      itemCount: apiResult.length,
      itemBuilder: (BuildContext context, int index) {
        final Game game = apiResult[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
          child: InkWell(
            onTap: () {
              //Navigator.of(context).pushNamed(pagina)
            },
            child: SizedBox(
              width: double.infinity,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image(
                      height: 300,
                      width: MediaQuery.of(context).size.width / 1.05,
                      fit: BoxFit.cover,
                      image: NetworkImage(game.image),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.05,
                      height: 100,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Text(
                                game.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              "Plataforma: " + game.platforms,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
