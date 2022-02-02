import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:pokemon_app/model/pokemon_model.dart';

class ServicePokemon {
  static Future<ModelPokemons> getPokemons() async {
    var response = await Dio().get(
        "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

    return ModelPokemons.fromJson(jsonDecode(response.data));
  }
}
