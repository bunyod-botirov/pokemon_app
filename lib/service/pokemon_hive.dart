import 'package:hive_flutter/hive_flutter.dart';
import 'package:pokemon_app/model/pokemon_model.dart';

class PokemonHive {
  static Box? pokemonsBox;

  static Future initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(ModelPokemonsAdapter());
    Hive.registerAdapter(PokemonAdapter());
    Hive.registerAdapter(EvolutionAdapter());
    pokemonsBox = await Hive.openBox('pokemonsBox');
  }

  static Future putDataToHive(ModelPokemons data) async {
    await pokemonsBox!.clear();
    await pokemonsBox!.add(data);
  }
}
