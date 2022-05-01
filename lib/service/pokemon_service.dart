import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:pokemon_app/model/pokemon_model.dart';
import 'package:pokemon_app/service/pokemon_hive.dart';

class ServicePokemon {
  static Future getPokemons() async {
    try {
      var response = await Dio().get(
          "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");

      await PokemonHive.putDataToHive(
          ModelPokemons.fromJson(jsonDecode(response.data)));
    } catch (e) {
      debugPrint("No Internet");
    }
  }
}
