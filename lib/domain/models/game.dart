import 'dart:convert';

class Game {
  Game({
    required this.id,
    required this.title,
    required this.worth,
    required this.thumbnail,
    required this.image,
    required this.description,
    required this.instructions,
    required this.openGiveawayUrl,
    required this.publishedDate,
    required this.platforms,
    required this.endDate,
    required this.users,
    required this.gamerpowerUrl,
    required this.openGiveaway,
  });

  int id;
  String title;
  String worth;
  String thumbnail;
  String image;
  String description;
  String instructions;
  String openGiveawayUrl;
  DateTime publishedDate;
  String platforms;
  dynamic endDate;
  int users;
  String gamerpowerUrl;
  String openGiveaway;

  List<Game> gameFromJson(String str) =>
      List<Game>.from(json.decode(str).map((x) => Game.fromJson(x)));

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        id: json["id"],
        title: json["title"],
        worth: json["worth"],
        thumbnail: json["thumbnail"],
        image: json["image"],
        description: json["description"],
        instructions: json["instructions"],
        openGiveawayUrl: json["open_giveaway_url"],
        publishedDate: DateTime.parse(json["published_date"]),
        platforms: json["platforms"],
        endDate: json["end_date"],
        users: json["users"],
        gamerpowerUrl: json["gamerpower_url"],
        openGiveaway: json["open_giveaway"],
      );
}
