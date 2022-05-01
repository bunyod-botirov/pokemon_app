import 'package:hive_flutter/hive_flutter.dart';

part 'pokemon_model.g.dart';

@HiveType(typeId: 0)
class ModelPokemons {
  ModelPokemons({
    this.pokemon,
  });

  @HiveField(0)
  List<Pokemon>? pokemon;

  factory ModelPokemons.fromJson(Map<String, dynamic> json) => ModelPokemons(
        pokemon:
            List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
      );
}

@HiveType(typeId: 1)
class Pokemon {
  Pokemon({
    this.id,
    this.num,
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.candy,
    this.candyCount,
    this.egg,
    this.spawnChance,
    this.avgSpawns,
    this.spawnTime,
    this.multipliers,
    this.weaknesses,
    this.nextEvolution,
    this.prevEvolution,
  });

  @HiveField(0)
  int? id;
  @HiveField(1)
  String? num;
  @HiveField(2)
  String? name;
  @HiveField(3)
  String? img;
  @HiveField(4)
  List<String>? type;
  @HiveField(5)
  String? height;
  @HiveField(6)
  String? weight;
  @HiveField(7)
  String? candy;
  @HiveField(8)
  int? candyCount;
  @HiveField(9)
  String? egg;
  @HiveField(10)
  double? spawnChance;
  @HiveField(11)
  double? avgSpawns;
  @HiveField(12)
  String? spawnTime;
  @HiveField(13)
  List<double>? multipliers;
  @HiveField(14)
  List<String>? weaknesses;
  @HiveField(15)
  List<Evolution>? nextEvolution;
  @HiveField(16)
  List<Evolution>? prevEvolution;

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        id: json["id"],
        num: json["num"],
        name: json["name"],
        img: json["img"],
        type: List<String>.from(json["type"].map((x) => x)),
        height: json["height"],
        weight: json["weight"],
        candy: json["candy"],
        candyCount: json["candy_count"] == null ? null : json["candy_count"]!,
        egg: json["egg"],
        spawnChance: json["spawn_chance"].toDouble(),
        avgSpawns: json["avg_spawns"].toDouble(),
        spawnTime: json["spawn_time"],
        multipliers: json["multipliers"] == null
            ? null
            : List<double>.from(json["multipliers"].map((x) => x.toDouble())),
        weaknesses: List<String>.from(json["weaknesses"].map((x) => x)),
        nextEvolution: json["next_evolution"] == null
            ? null
            : List<Evolution>.from(
                json["next_evolution"].map((x) => Evolution.fromJson(x))),
        prevEvolution: json["prev_evolution"] == null
            ? null
            : List<Evolution>.from(
                json["prev_evolution"].map((x) => Evolution.fromJson(x))),
      );
}

@HiveType(typeId: 2)
class Evolution {
  Evolution({
    this.num,
    this.name,
  });
  @HiveField(0)
  String? num;
  @HiveField(1)
  String? name;

  factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        num: json["num"],
        name: json["name"],
      );
}
