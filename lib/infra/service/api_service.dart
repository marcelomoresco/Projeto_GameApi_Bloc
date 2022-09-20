import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../domain/models/game.dart';

class ApiService {
  final api_url = Uri.parse('https://www.gamerpower.com/api/giveaways');

  Future<List<Game>?> fetchData() async {
    try {
      final response = await http.Client().get(api_url);

      if (response.statusCode == 200) {
        var models = jsonDecode(response.body);
        List<Game> gameModels = [];

        for (var model in models) {
          Game gameModel = Game.fromJson(model);
          gameModels.add(gameModel);
        }
        return gameModels;
      }
    } catch (e) {
      return null;
    }
  }
}
