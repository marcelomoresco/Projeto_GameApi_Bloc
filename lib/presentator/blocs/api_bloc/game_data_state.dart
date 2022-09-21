// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'game_data_bloc.dart';

abstract class GameDataState extends Equatable {
  const GameDataState();

  @override
  List<Object> get props => [];
}

class GameDataInitial extends GameDataState {}

class GameDataLoadingState extends GameDataState {}

class GameDataLoadedState extends GameDataState {
  final List<Game> api_result;

  GameDataLoadedState({
    required this.api_result,
  });
}

class GameDataErrorState extends GameDataState {
  final String errorMessage;

  const GameDataErrorState(this.errorMessage);
}
