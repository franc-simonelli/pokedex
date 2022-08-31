// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:convert';

import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:pokedex/models/json/pokemon_json_model.dart';
import '../models/pokeapi/abilities_model.dart';
import '../models/pokeapi/information_pokemon_model.dart';
import '../models/pokeapi/pokemon_model.dart';
import '../models/pokeapi/stats_model.dart';
import '../models/pokeapi/types_model.dart';
import 'http_service.dart';

class PokemonService {
  final HttpService _httpService = Injector().get<HttpService>();

  Future<List<PokemonJsonFromApi>> getAllPokemonFromJson() async {
    // Fimber.i("FaqsService - getFaqs started");
    var response = await _httpService.httpGet("https://gist.githubusercontent.com/hungps/0bfdd96d3ab9ee20c2e572e47c6834c7/raw/pokemons.json", false);
    if (response.success == true) {
      // Fimber.i('Faqs founded');
      List<PokemonJsonFromApi> pokemon = [];
      (jsonDecode(response.data) as List<dynamic>).forEach((element) {
        pokemon.add(PokemonJsonFromApi.fromJson(element));

      });
      // print(ingredienti);
      // Fimber.i('Faqs founded ${faqs.length}');
      return pokemon;
    } else {
      // Fimber.i('FaqsService - getFaqs error intercepted');
      throw Exception(
          "Errore in fase di recupero delle informazioni: ${response.errorMessage}");
    }
  }

  Future<List<PokemonName>> getAllPokemon(limit, offset) async {
    // Fimber.i("FaqsService - getFaqs started");
    var response = await _httpService.httpGet("pokemon?limit=$limit&offset=$offset", true);
    if (response.success == true) {
      // Fimber.i('Faqs founded');
      List<PokemonName> pokemon = [];
      (jsonDecode(response.data)['results'] as List<dynamic>).forEach((element) {
        pokemon.add(PokemonName.fromJson(element));

      });
      // print(ingredienti);
      // Fimber.i('Faqs founded ${faqs.length}');
      return pokemon;
    } else {
      // Fimber.i('FaqsService - getFaqs error intercepted');
      throw Exception(
          "Errore in fase di recupero delle informazioni: ${response.errorMessage}");
    }
  }

  Future<List<Types>> getTypesById(id) async {
    var response = await _httpService.httpGet("pokemon/$id", true);

    if (response.success == true) {
      List<Types> types = [];
      (jsonDecode(response.data)['types'] as List<dynamic>).forEach((element) {
        types.add(Types.fromJson(element));

      });
        // element.image = 'https://www.thecocktaildb.com/images/ingredients/' + element[0].value +  '-Small.png';
      return types;
    } else {
      throw Exception(
          "Errore in fase di invio: ${response.errorMessage}");
    }
  }

  Future<Information> getInformationById(id) async {
    var response = await _httpService.httpGet("pokemon/$id", true);

    if (response.success == true) {
      // Pokemon pokemon = Pokemon(0, '', [], 0, [], 0);
      // pokemon = (jsonDecode(response.data));
      // Map<String, dynamic> data = new Map<String, dynamic>.from(json.decode(response.data));

      Information information = Information([], 0, [], 0);
      information.abilities = [];
      information.stats = [];
      (jsonDecode(response.data)['abilities'] as List<dynamic>).forEach((element) {
        information.abilities!.add(Abilities.fromJson(element));
      });
      (jsonDecode(response.data)['stats'] as List<dynamic>).forEach((element) {
        information.stats!.add(Stats.fromJson(element));
      });
      information.weight = (jsonDecode(response.data)['weight']);
      information.height = (jsonDecode(response.data)['height']);

      return information;
    } else {
      throw Exception(
          "Errore in fase di invio: ${response.errorMessage}");
    }
  }

  Future<Pokemon> getPokemonById(id) async {
    var response = await _httpService.httpGet("pokemon/$id", true);

    if (response.success == true) {

      Pokemon pokemon = Pokemon(0, '', [], [], 0, [], 0);
      pokemon.abilities = [];
      pokemon.stats = [];
      pokemon.types = [];

      var decode = jsonDecode(response.data);
      pokemon = Pokemon.fromJson(decode);
      return pokemon;
    } else {
      throw Exception(
          "Errore in fase di invio: ${response.errorMessage}");
    }
  }
}