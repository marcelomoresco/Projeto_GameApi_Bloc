// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:projeto_api_bloc/infra/service/api_service.dart';

import '../../domain/models/game.dart';

part 'game_data_event.dart';
part 'game_data_state.dart';

class GameDataBloc extends Bloc<GameDataEvent, GameDataState> {
  final ApiService apiService;

  GameDataBloc(
    this.apiService,
  ) : super(GameDataInitial()) {
    on<GameDataEvent>((event, emit) async {
      if (event is LoadGameDataEvent) {
        emit(GameDataLoadingState());
        List<Game>? apiResult = await apiService.fetchData();
        if (apiResult == null) {
          emit(const GameDataErrorState("Erro na conexão"));
        } else {
          emit(GameDataLoadedState(api_result: apiResult));
        }
      }
    });
  }
}
